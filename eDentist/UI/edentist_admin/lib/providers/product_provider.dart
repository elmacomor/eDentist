import 'base_provider.dart';
import '../models/product.dart';

class ProductProvider<T> extends BaseProvider<Product> {
  ProductProvider() : super("Products");

  @override
  Product fromJson(data) {
    return Product.fromJson(data);
  }
}
