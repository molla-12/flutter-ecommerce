part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullname;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipcode;
  final Cart? cart;

  UpdateCheckout(
      {this.fullname,
      this.email,
      this.address,
      this.city,
      this.country,
      this.cart,
      this.zipcode});

  @override
  List<Object?> get props => [
        fullname,
        email,
        address,
        city,
        country,
        cart,
        zipcode,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
