import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocks/cart/cart_bloc.dart';
import '../../blocks/checkout/checkout_bloc.dart';
import '../../widgets/widget.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CheckoutScreen());
  }

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController adressController = TextEditingController();
    // final TextEditingController cityController = TextEditingController();
    // final TextEditingController countryController = TextEditingController();
    // final TextEditingController zipcodeController = TextEditingController();

    return Scaffold(
      appBar: CustomAppbar(title: 'checkout'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CheckoutLoaded) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(ConfirmCheckout(checkout: state.checkout));
                    },
                    child: Text(
                      'Order now',
                      style: Theme.of(context).textTheme.headline3!,
                    ));
              } else {
                return Text('hhh');
              }
            })
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child:
            BlocBuilder<CheckoutBloc, CheckoutState>(builder: (context, state) {
          if (state is CheckoutLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal informatio',
                  style: Theme.of(context).textTheme.headline2!,
                ),
                _buildTextFormField((value) {
                  context
                      .read<CheckoutBloc>()
                      .add(UpdateCheckout(email: value));
                }, context, 'email'),
                _buildTextFormField((value) {
                  context
                      .read<CheckoutBloc>()
                      .add(UpdateCheckout(fullname: value));
                }, context, 'fullname'),
                Text(
                  'Delivery info informatio',
                  style: Theme.of(context).textTheme.headline2!,
                ),
                _buildTextFormField((value) {
                  context
                      .read<CheckoutBloc>()
                      .add(UpdateCheckout(address: value));
                }, context, 'address'),
                _buildTextFormField((value) {
                  context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
                }, context, 'city'),
                _buildTextFormField((value) {
                  context
                      .read<CheckoutBloc>()
                      .add(UpdateCheckout(country: value));
                }, context, 'country'),
                _buildTextFormField((value) {
                  context
                      .read<CheckoutBloc>()
                      .add(UpdateCheckout(zipcode: value));
                }, context, 'zipcode'),
                Text(
                  'order summery informatio',
                  style: Theme.of(context).textTheme.headline2!,
                ),
                OrderSummery(),
              ],
            );
          } else {
            return Text('error on loading');
          }
        }),
      ),
    );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(children: [
        SizedBox(
          width: 75,
          child: Text(labelText, style: Theme.of(context).textTheme.headline2),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
                isDense: true, contentPadding: EdgeInsets.only(left: 12.0)),
          ),
        )
      ]),
    );
  }
}
