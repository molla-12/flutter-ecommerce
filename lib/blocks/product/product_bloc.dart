import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_now/models/models.dart';

import '../../repository/product/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is LoadProduct) {
      yield* _mapLoadProductToState();
    }
    if (event is UpdateProduct) {
      yield* _mapUpdateProductToState(event);
    }
  }

  Stream<ProductState> _mapLoadProductToState() async* {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProduct().listen(
          (product) => add(
            UpdateProduct(product),
          ),
        );
  }

  Stream<ProductState> _mapUpdateProductToState(UpdateProduct event) async* {
    yield ProductLoaded(product: event.product);
  }
}
