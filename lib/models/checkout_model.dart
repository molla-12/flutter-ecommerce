import 'package:equatable/equatable.dart';
import 'package:shop_now/models/product_model.dart';

class Checkout extends Equatable {
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

  const Checkout(
      {required this.fullname,
      required this.email,
      required this.address,
      required this.city,
      required this.country,
      required this.zipcode,
      required this.products,
      required this.subTotal,
      required this.deliveryFree,
      required this.total});

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
  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipcode'] = zipcode;
    return {
      'customerAddress': customerAddress,
      'customerName': fullname!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subTotal!,
      'deliveryFee': deliveryFree!,
      'total': total!,
    };
  }
}
