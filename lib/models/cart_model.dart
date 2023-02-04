import 'package:equatable/equatable.dart';
import 'package:shop_now/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String freeDeleivery(subtotal) {
    if (subtotal >= 30.0) {
      return 'you have free deleivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'ADD \$${missing.toStringAsFixed(2)} for Free deliver';
    }
  }

  double deliveryFee(subtotal) {
    if (subtotal >= 30) {
      return 0;
    } else {
      return 10;
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDeleivery(subtotal);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  // List<Product> products = [
  //   Product(
  //       name: 'flower',
  //       category: 'car',
  //       imgUrl:
  //           'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //       price: 2.0,
  //       isRecomanded: true,
  //       isPopular: false),
  //   Product(
  //       name: 'food',
  //       category: 'car',
  //       imgUrl:
  //           'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_960_720.jpg',
  //       price: 12.0,
  //       isRecomanded: true,
  //       isPopular: false),
  //   Product(
  //       name: 'gasjr',
  //       category: 'food',
  //       imgUrl:
  //           'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  //       price: 12.0,
  //       isRecomanded: true,
  //       isPopular: true)
  // ];

  @override
  List<Object?> get props => [products];
}
