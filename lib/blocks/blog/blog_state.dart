part of 'blog_bloc.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  final List<Blog> blog;

  const BlogLoaded({this.blog = const <Blog>[]});

  @override
  List<Object> get props => [blog];
}

class BlogError extends BlogState {}
