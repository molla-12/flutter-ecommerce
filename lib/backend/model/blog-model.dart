import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final int id;
  final String title;
  final String category;
  final String description;
  final String imgUrl;
  final bool isRecomanded;
  final bool isPopular;
  Blog({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.imgUrl,
    required this.isRecomanded,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        category,
        description,
        imgUrl,
        isRecomanded,
        isPopular,
      ];

  Blog copyWith({
    int? id,
    String? title,
    String? category,
    String? description,
    String? imgUrl,
    bool? isRecomanded,
    bool? isPopular,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      isRecomanded: isRecomanded ?? this.isRecomanded,
      isPopular: isPopular ?? this.isPopular,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'imgUrl': imgUrl,
      'isRecomanded': isRecomanded,
      'isPopular': isPopular,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
        id: map['id'],
        title: map['title'],
        category: map['category'],
        description: map['description'],
        imgUrl: map['imgUrl'],
        isRecomanded: map['isRecomanded'],
        isPopular: map['isPopular']);
  }
  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  bool get stringfy => true;

  static List<Blog> Blogs = [
    Blog(
      id: 1,
      title: 'flower',
      category: 'car',
      description: 'some',
      imgUrl:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      isRecomanded: true,
      isPopular: false,
    ),
    Blog(
        id: 2,
        title: 'flower',
        category: 'car',
        description: 'some',
        imgUrl:
            'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_960_720.jpg',
        isRecomanded: true,
        isPopular: false),
    Blog(
        id: 23,
        title: 'flower',
        category: 'food',
        description: 'some description',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        isRecomanded: true,
        isPopular: true)
  ];

  static formSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {}
}
