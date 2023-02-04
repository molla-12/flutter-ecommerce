import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final bool isRecomanded;
  final bool isPopular;

  Product(
      {required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.isRecomanded,
      required this.isPopular});

  @override
  List<Object?> get props =>
      [name, category, imgUrl, price, isRecomanded, isPopular];

  static Product formSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imgUrl: snap['imgUrl'],
      price: snap['price'],
      isRecomanded: snap['isRecomanded'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  static List<Product> products = [
    Product(
        name: 'flower',
        category: 'car',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 12.0,
        isRecomanded: true,
        isPopular: false),
    Product(
        name: 'food',
        category: 'car',
        imgUrl:
            'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_960_720.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: false),
    Product(
        name: 'gasjr',
        category: 'food',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'kak',
        category: 'fruit',
        imgUrl: 'assets/2.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'T-shert',
        category: 'fruit',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 434.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'cotx',
        category: 'fruit',
        imgUrl: 'assets/c3.jpg',
        price: 33.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'T-shert',
        category: 'fruit',
        imgUrl: 'assets/c2.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'watch',
        category: 'electronics',
        imgUrl: 'assets/e1.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'Spooon',
        category: 'cart',
        imgUrl: 'assets/c1.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
    Product(
        name: 'mobile',
        category: 'electronics',
        imgUrl: 'assets/2.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: true),
  ];
}
