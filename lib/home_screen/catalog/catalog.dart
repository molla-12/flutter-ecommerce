import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/models/models.dart';

import '../../blocks/product/product_bloc.dart';
import '../../widgets/widget.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;
  CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // final List<Product> productCategory = Product.products
    //     .where((product) => product.category == category.name)
    //     .toList();
    return Scaffold(
      appBar: CustomAppbar(title: category.name),
      bottomNavigationBar: CustomBottomAppbar(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductLoaded) {
            final List<Product> productCategory = state.product
                .where((product) => product.category == category.name)
                .toList();
            return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: productCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductList(
                    product: productCategory[index],
                    widthFactor: 2.2,
                  );
                });
          } else {
            return const Text('No Recomanded Product found');
          }
        },
      ),
    );
  }
}
