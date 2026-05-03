import 'package:eprodaja_admin/models/color.dart';
import 'package:eprodaja_admin/models/product_type.dart';

import 'base_provider.dart';

class ProductTypeProvider extends BaseProvider<ProductType> {
  ProductTypeProvider() : super("ProductType");

  @override
  ProductType fromJson(data) {
    return ProductType.fromJson(data);
  }
}
