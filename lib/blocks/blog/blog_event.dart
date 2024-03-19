part of 'blog_bloc.dart';

abstract class BlogEvent extends Equatable {
  const BlogEvent();

  @override
  List<Object> get props => [];
}

class LoadBlog extends BlogEvent {}

class UpdateBlog extends BlogEvent {
  final List<Blog> blog;

  const UpdateBlog(this.blog);

  @override
  List<Object> get props => [blog];
}
