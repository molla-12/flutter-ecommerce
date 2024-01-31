import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/cart/cart_bloc.dart';

import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Image.network(product.imgUrl,
              width: 120, height: 100, fit: BoxFit.cover),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text('\$${product.price}',
                    style: Theme.of(context).textTheme.displaySmall)
              ],
            ),
          ),
          const SizedBox(width: 10.0),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemoved(product));
                      },
                      icon: Icon(Icons.remove_circle)),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdded(product));
                      },
                      icon: Icon(Icons.add_circle)),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
