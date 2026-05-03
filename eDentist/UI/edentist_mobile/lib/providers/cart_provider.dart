import 'package:collection/collection.dart';
import 'package:edentist_mobile/models/cart.dart';
import 'package:edentist_mobile/models/product.dart';
import 'package:edentist_mobile/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Cart cart = Cart();

  addToCart(Product product) {
    if (findInCart(product) != null) {
      findInCart(product)?.count++;
    } else {
      cart.items.add(CartItem(product, 1));
    }
    calculateTotal();
    notifyListeners();
  }

  removeFromCart(Product product) {
    cart.items
        .removeWhere((item) => item.product.productId == product.productId);
    notifyListeners();
  }

  CartItem? findInCart(Product product) {
    CartItem? item = cart.items.firstWhereOrNull(
        (item) => item.product.productId == product.productId);
    return item;
  }

  decreaseQuantity(Product product) {
    final existingItem = findInCart(product);

    if (existingItem != null) {
      existingItem.count--;
      if (existingItem.count == 0) {
        cart.items.remove(existingItem);
      }
    }
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    total = 0;
    for (var item in cart.items) {
      total += item.count * (item.product.productPrice ?? 0.0);
    }
  }
}
