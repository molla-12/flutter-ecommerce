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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, categoryState) {
          if (categoryState is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (categoryState is CategoryLoaded) {
            return BlocBuilder<ProductBloc, ProductState>(
              builder: (context, productState) {
                if (productState is ProductLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (productState is ProductLoaded) {
                  return Column(
                    children: [
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1.5,
                            viewportFraction: 0.9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                          items: categoryState.categories
                              .map((category) =>
                                  HeroCarouselCard(category: category))
                              .toList(),
                        ),
                      ),
                      const SectionTitle(title: 'Popular'),
                      ProductCarousel(
                        products: productState.product
                            .where((product) => product.isPopular)
                            .toList(),
                      ),
                      const SectionTitle(title: 'Recomanded'),
                      ProductCarousel(
                        products: productState.product
                            .where((product) => product.isRecomanded)
                            .toList(),
                      ),
                    ],
                  );
                } else {
                  return const Text('No products found');
                }
              },
            );
          } else {
            return const Text('No categories found');
          }
        },
      ),
    );
  }
}
