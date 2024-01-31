import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/wishlist_bloc.dart';
import 'package:shop_now/models/models.dart';

import '../../blocks/cart/cart_bloc.dart';
import '../../widgets/widget.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProductScreen(product: product),
    );
  }

  final Product product;
  const ProductScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: product.name),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context.read<WishlistBloc>().add(AddWishlistProduct(product));
                },
                icon: Icon(Icons.favorite, color: Colors.white),
              );
            }),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductAdded(product));
                    },
                    child: Text(
                      'Add To Cart',
                      style: Theme.of(context).textTheme.displaySmall!,
                    ));
              },
            )
          ]),
        ),
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarouselCard(
                  product: product,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('Product information',
                style: Theme.of(context).textTheme.displayMedium),
            children: [
              ListTile(
                title: Text(
                    'This product is very popular you can buy with greate dis count from our store'),
              )
            ],
          ),
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('shipping information',
                style: Theme.of(context).textTheme.displayMedium),
            children: [
              const ListTile(
                title: Text(
                    'we giv free deliver over 202 countris in cloudunfdfnThis product is very popular you can buy with greate dis count from our store'),
              )
            ],
          )
        ],
      ),
    );
  }
}
