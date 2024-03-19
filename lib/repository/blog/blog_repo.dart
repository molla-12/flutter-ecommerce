import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_now/models/models.dart';
import 'package:shop_now/repository/blog/base_blog_repo.dart';

class BlogRepository extends BaseBlogRepository {
  final FirebaseFirestore _firebaseFirestore;
  BlogRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Blog>> getAllBlogs() {
    return _firebaseFirestore.collection('blogs').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Blog.formSnapshot(doc)).toList();
    });
  }
}
