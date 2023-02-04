part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;

  const ProductLoaded({this.product = const <Product>[]});

  @override
  List<Object> get props => [product];
}

class ProductError extends ProductState {}
