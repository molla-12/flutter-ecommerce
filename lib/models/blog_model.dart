import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Blog extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final bool isRecomanded;
  final bool isPopular;

  Blog(
      {required this.name,
      required this.category,
      required this.imgUrl,
      required this.isRecomanded,
      required this.isPopular});

  @override
  List<Object?> get props => [name, category, imgUrl, isRecomanded, isPopular];

  static Blog formSnapshot(DocumentSnapshot snap) {
    Blog blog = Blog(
      name: snap['name'],
      category: snap['category'],
      imgUrl: snap['imgUrl'],
      isRecomanded: snap['isRecomanded'],
      isPopular: snap['isPopular'],
    );
    return blog;
  }

  static List<Blog> blogs = [
    Blog(
        name: 'flower',
        category: 'car',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        isRecomanded: true,
        isPopular: false),
    Blog(
        name: 'food',
        category: 'car',
        imgUrl:
            'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930_960_720.jpg',
        isRecomanded: true,
        isPopular: false),
    Blog(
        name: 'gasjr',
        category: 'food',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'kak',
        category: 'fruit',
        imgUrl: 'assets/2.jpg',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'T-shert',
        category: 'fruit',
        imgUrl:
            'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'cotx',
        category: 'fruit',
        imgUrl: 'assets/c3.jpg',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'T-shert',
        category: 'fruit',
        imgUrl: 'assets/c2.jpg',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'watch',
        category: 'electronics',
        imgUrl: 'assets/e1.jpg',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'Spooon',
        category: 'cart',
        imgUrl: 'assets/c1.jpg',
        isRecomanded: true,
        isPopular: true),
    Blog(
        name: 'mobile',
        category: 'electronics',
        imgUrl: 'assets/2.jpg',
        isRecomanded: true,
        isPopular: true),
  ];
}
