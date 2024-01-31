import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        color: Colors.blueGrey,
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
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(ConfirmCheckout(checkout: state.checkout));
                    },
                    child: Text(
                      'Order now',
                      style: Theme.of(context).textTheme.displaySmall!,
                    ));
              } else {
                return Text('hhh');
              }
            })
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
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
                    style: Theme.of(context).textTheme.displayMedium!,
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
                    style: Theme.of(context).textTheme.displayMedium!,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'address'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
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
                    'Order summery',
                    style: Theme.of(context).textTheme.displayMedium!,
                  ),
                  OrderSummery(),
                ],
              );
            } else {
              return Text('error on loading');
            }
          }),
        ),
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
          child: Text(labelText[0].toUpperCase() + labelText.substring(1),
              style: Theme.of(context).textTheme.displayMedium),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: false,
                hintText: labelText.toUpperCase(),
                contentPadding: EdgeInsets.only(left: 12.0)),
          ),
        )
      ]),
    );
  }
}
