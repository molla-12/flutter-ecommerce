import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/cart/cart_bloc.dart';
import 'package:shop_now/models/models.dart';

import '../blocks/wishlist_bloc.dart';

class ProductList extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishList;
  const ProductList({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishList = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double WidthValue = MediaQuery.of(context).size.width / widthFactor;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/product', arguments: product);
        },
        child: Stack(
          children: [
            Container(
              width: WidthValue,
              height: 150,
              child: Image.network(
                product.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                width: WidthValue - 5 - leftPosition,
                height: 80,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(color: Colors.black12),
                child: Text('{product.price}'),
              ),
            ),
            Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                width: WidthValue - 15 - leftPosition,
                height: 70,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              icon: Icon(Icons.add_circle, color: Colors.white),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                              },
                            ),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              icon: Icon(Icons.add_circle, color: Colors.white),
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                              },
                            ),
                          );
                        } else {
                          return Text('Somthing go wrong');
                        }
                      },
                    ),
                    isWishList
                        ? BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, state) {
                              return Expanded(
                                child: IconButton(
                                    icon:
                                        Icon(Icons.delete, color: Colors.white),
                                    onPressed: () {
                                      context
                                          .read<WishlistBloc>()
                                          .add(RemoveWishlistProduct(product));
                                    }),
                              );
                            },
                          )
                        : SizedBox()
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
