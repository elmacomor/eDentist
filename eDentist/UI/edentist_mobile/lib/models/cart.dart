import 'package:edentist_mobile/models/product.dart';

class Cart {
  List<CartItem> items = [];
  int? userId;

  // Factory method to create a new Cart object
  factory Cart() => Cart._();

  Cart._(); // Private constructor

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'userId': userId,
    };
  }

  Cart.fromJson(Map<String, dynamic> json) {
    items = (json['items'] as List<dynamic>)
        .map((itemData) => CartItem.fromJson(itemData))
        .toList();
    userId = json['userId'];
  }
}

class CartItem {
  CartItem(this.product, this.count);
  late Product product;
  late int count;

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'count': count,
    };
  }

  CartItem.fromJson(Map<String, dynamic> json) {
    product = Product.fromJson(json['product']);
    count = json['count'] as int;
  }
}
