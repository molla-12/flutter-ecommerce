import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/category/category_bloc.dart';
import 'package:shop_now/blocks/product/product_bloc.dart';
import '../../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'ET Shop Now'),
      bottomNavigationBar: CustomBottomAppbar(),
      body: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  ),
                );
              } else {
                return const Text('No product list found');
              }
            },
          ),
          const SectionTitle(title: 'Recomanded Products'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              return ProductCarousel(
                  products: state.product
                      .where((product) => product.isRecomanded)
                      .toList());
            } else {
              return const Text('No Recomanded Product found');
            }
          }),
          const SectionTitle(title: 'Popular Products'),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductLoaded) {
              return ProductCarousel(
                  products: state.product
                      .where((product) => product.isPopular)
                      .toList());
            } else {
              return const Text('No Porpular product found');
            }
          }),
        ],
      ),
    );
  }
}
