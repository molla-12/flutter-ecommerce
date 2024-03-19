import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_now/models/models.dart';
import 'package:shop_now/repository/blog/blog_repo.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository _blogRepository;
  StreamSubscription? _blogSubscription;

  BlogBloc({required BlogRepository blogRepository})
      : _blogRepository = blogRepository,
        super(BlogLoading());

  @override
  Stream<BlogState> mapEventToState(
    BlogEvent event,
  ) async* {
    if (event is LoadBlog) {
      yield* _mapLoadBlogToState();
    }
    if (event is UpdateBlog) {
      yield* _mapUpdateBlogToState(event);
    }
  }

  Stream<BlogState> _mapLoadBlogToState() async* {
    _blogSubscription?.cancel();
    _blogSubscription = _blogRepository.getAllBlogs().listen(
          (blog) => add(
            UpdateBlog(blog),
          ),
        );
  }

  Stream<BlogState> _mapUpdateBlogToState(UpdateBlog event) async* {
    yield BlogLoaded(blog: event.blog);
  }
}
