part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullname;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipcode;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFree;
  final String? total;
  final Checkout checkout;

  CheckoutLoaded(
      {this.fullname,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipcode,
      this.products,
      this.subTotal,
      this.deliveryFree,
      this.total})
      : checkout = Checkout(
            fullname: fullname,
            email: email,
            address: address,
            city: city,
            country: country,
            zipcode: zipcode,
            products: products,
            subTotal: subTotal,
            deliveryFree: deliveryFree,
            total: total);

  @override
  List<Object?> get props => [
        fullname,
        email,
        address,
        city,
        country,
        zipcode,
        products,
        subTotal,
        deliveryFree,
        total
      ];
}
