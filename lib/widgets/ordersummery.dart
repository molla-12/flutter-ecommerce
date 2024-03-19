import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/blocks/cart/cart_bloc.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      if (state is CartLoaded) {
        return Column(
          children: [
            const Divider(thickness: 2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SubTotal',
                          style: Theme.of(context).textTheme.displayMedium!),
                      Text('\$${state.cart.subtotalString}',
                          style: Theme.of(context).textTheme.displayMedium!)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          style: Theme.of(context).textTheme.displayMedium!),
                      Text('\$${state.cart.deliveryFeeString}',
                          style: Theme.of(context).textTheme.displayMedium!),
                      Text('Tax Fee',
                          style: Theme.of(context).textTheme.displayMedium!),
                      Text('\$${state.cart.tax}',
                          style: Theme.of(context).textTheme.displayMedium!)
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width - 10,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'price',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Text('\$${state.cart.totalString}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      } else {
        return Text('no data available');
      }
    });
  }
}
