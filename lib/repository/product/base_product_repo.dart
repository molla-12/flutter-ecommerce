import 'package:shop_now/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProduct();
}
