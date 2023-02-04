import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imgUrl;
  final bool isRecomanded;
  final bool isPopular;
  double price;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.imgUrl,
    required this.isRecomanded,
    required this.isPopular,
    this.price = 0,
    this.quantity = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        description,
        imgUrl,
        isRecomanded,
        isPopular,
        price,
        quantity,
      ];

  Product copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? imgUrl,
    bool? isRecomanded,
    bool? isPopular,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      isRecomanded: isRecomanded ?? this.isRecomanded,
      isPopular: isPopular ?? this.isPopular,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'description': description,
      'imgUrl': imgUrl,
      'isRecomanded': isRecomanded,
      'isPopular': isPopular,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        description: map['description'],
        imgUrl: map['imgUrl'],
        isRecomanded: map['isRecomanded'],
        isPopular: map['isPopular']);
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  bool get stringfy => true;

  static List<Product> products = [
    Product(
      id: 1,
      name: 'flower',
      category: 'car',
      description: 'some',
      imgUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      price: 2.0,
      isRecomanded: true,
      isPopular: false,
      quantity: 12,
    ),
    Product(
        id: 2,
        name: 'flower',
        category: 'car',
        description: 'some',
        imgUrl:
            'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_960_720.jpg',
        price: 12.0,
        isRecomanded: true,
        isPopular: false),
    Product(
        id: 23,
        name: 'flower',
        category: 'food',
        description: 'some description',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        price: 12.0,
        isRecomanded: true,
        isPopular: true)
  ];
}
