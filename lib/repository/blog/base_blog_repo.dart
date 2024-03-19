import 'package:shop_now/models/models.dart';

abstract class BaseBlogRepository {
  Stream<List<Blog>> getAllBlogs();
}
