import 'package:edentist_mobile/models/transakcija.dart';
import 'package:edentist_mobile/providers/cart_provider.dart';
import 'package:edentist_mobile/providers/product_provider.dart';
import 'package:edentist_mobile/providers/transakcija_provider.dart';
import 'package:edentist_mobile/screens/cart_screen.dart';
import 'package:edentist_mobile/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaypalScreen extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int userId;
  final int? narudzbaId;
  final int? iznos;

  PaypalScreen(
      {required this.items,
      required this.userId,
      required this.narudzbaId,
      required this.iznos,
      super.key});

  @override
  State<PaypalScreen> createState() => _PaypalScreenState();
}

class _PaypalScreenState extends State<PaypalScreen> {
  late List<Map<String, dynamic>> itemList = [];
  late ProductProvider _productProvider;
  late TransakcijaProvider _transakcijaProvider;
  late CartProvider _cartProvider;

  @override
  void initState() {
    super.initState();
    print(widget.userId);
    print(DateTime.now());
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    _transakcijaProvider =
        Provider.of<TransakcijaProvider>(context, listen: false);
    _cartProvider = Provider.of<CartProvider>(context, listen: false);

    _navigateToPaypalCheckout();
  }

  void _navigateToPaypalCheckout() async {
    int totalAmount = await calculateTotalAmount(widget.items);
    await buildItemList(widget.items);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckout(
        sandboxMode: true,
        clientId:
            "AVHVqi9JbeA1DgpFHQf5hY2tJwhyek3GKWTYrhmZfbdcrE1wlAvf-2-44ixZM_FiGnL4d96vxCiGCHvC",
        secretKey:
            "EKtpVbGTgSRuedBx88PWYck3tqvvRLRX-Tc9vRMagxZbRDSgT8aHFfN9kSTk1r7hqPvMHTZ25d4fI0bs",
        returnURL: "return.example.com",
        cancelURL: "cancel.example.com",
        transactions: [
          {
            "amount": {
              "total": totalAmount.toStringAsFixed(2),
              "currency": "USD",
              "details": {
                "subtotal": totalAmount.toStringAsFixed(2),
                "shipping": '0',
                "shipping_discount": 0,
              },
            },
            "description": "The payment transaction description.",
            "item_list": {"items": itemList},
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          if (params['data']['state'] == 'approved') {
            Transakcija request = Transakcija(
              null,
              widget.narudzbaId,
              widget.iznos,
              params['data']['state'],
              params['data']['id'],
              widget.userId,
              DateTime.now()
            );
            await _transakcijaProvider.insert(request);

            _cartProvider.cart.items.clear();
            total = 0.00;

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Order has been processed.'),
                backgroundColor: Colors.green,
              ),
            );
            print('Payment was successful..................');
          } else {
            print('Payment was not successful..........................');
          }
        },
        onError: (error) {
          print("Desio se errorrr.................: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('Payment canceled....................');
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(),
    );
  }

  Future<int> calculateTotalAmount(List<Map<String, dynamic>> items) async {
    int total = 0;

    for (var item in items) {
      int proizvodID = item["proizvodID"];
      int quantity = item["kolicina"];

      final product = await _productProvider.getById(proizvodID);

      if (product != null) {
        int price = product.productPrice ?? 0;
        total += price * quantity;
      }
    }

    return total;
  }

  Future<void> buildItemList(List<Map<String, dynamic>> items) async {
    itemList.clear();
    print(items.length.toString());

    int totalAmount = await calculateTotalAmount(items);

    for (var i = 0; i < items.length; i++) {
      if (i < items.length) {
        int proizvodID = items[i]["proizvodID"];
        final product = await _productProvider.getById(proizvodID);
        if (product != null) {
          String productName = product.productName!;
          int quantity = items[i]["kolicina"];
          int price = product.productPrice!;
          totalAmount += price * quantity;
          itemList.add({
            "name": productName,
            "quantity": quantity,
            "price": price.toStringAsFixed(2),
            "currency": "USD",
          });
          print(itemList);
        }
      } else {}
    }

    print("Total Amount: $totalAmount");
  }
}
