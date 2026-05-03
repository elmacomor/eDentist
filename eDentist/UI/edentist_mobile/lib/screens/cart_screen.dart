// ignore_for_file: use_build_context_synchronously
import 'package:edentist_mobile/models/cart.dart';
import 'package:edentist_mobile/models/order_detail.dart';
import 'package:edentist_mobile/providers/cart_provider.dart';
import 'package:edentist_mobile/providers/order_details_provider.dart';
import 'package:edentist_mobile/providers/order_providet.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/paypal_screen.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:edentist_mobile/widgets/master_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

double total = 0;

class _CartScreenState extends State<CartScreen> {
  late CartProvider _cartProvider;
  late OrderProvider _orderProvider;
  late UserProvider _korisniciProvider;
  late OrderDetailsProvider _orderDetailsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartProvider = context.watch<CartProvider>();
    _orderProvider = context.watch<OrderProvider>();
    _korisniciProvider = context.watch<UserProvider>();
    _orderDetailsProvider = context.watch<OrderDetailsProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: "Košarica",
      child: Column(
        children: [
          _buildProductCardList(),
          const SizedBox(
            height: 15,
          ),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildProductCardList() {
    return Expanded(
      child: _cartProvider.cart.items.isNotEmpty
          ? ListView.builder(
              itemCount: _cartProvider.cart.items.length,
              itemBuilder: (context, index) {
                return _buildProductCard(_cartProvider.cart.items[index]);
              },
            )
          : const Center(child: Text("Vaša kosarica je prazna.")),
    );
  }

  Widget _buildProductCard(CartItem item) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: imageFromBase64String(item.product.slika!),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ListTile(
                title: Text(item.product.productName ?? ""),
                subtitle: Text(item.product.productPrice.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        _cartProvider.decreaseQuantity(item.product);
                      },
                    ),
                    Text(item.count.toString()),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        _cartProvider.addToCart(item.product);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuyButton() {
    return Column(
      children: [
        Text(
          'Ukupno: ${total.toStringAsFixed(2)}', // Assuming total is a double
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: _cartProvider.cart.items.isEmpty
                      ? null
                      : () async {
                          List<Map<String, dynamic>> items = [];

                          for (var item in _cartProvider.cart.items) {
                            items.add(
                              {
                                "proizvodID": item.product.productId,
                                "kolicina": item.count,
                              },
                            );
                          }
                          int patientId = await getPatientId();

                          Map<String, dynamic> order = {
                            "orderDate": DateTime.now().toIso8601String(),
                            "userId": await getPatientId(),
                            "totalPrice": total.toInt(),
                          };

                          var response = await _orderProvider.insert(order);

                          for (var item in _cartProvider.cart.items) {
                            Map<String, dynamic> orderProduct = {
                              "orderHeaderId": response.orderHeaderId,
                              "productId": item.product.productId,
                              "quantity": item.count,
                            };
                            var result = await _orderDetailsProvider
                                .insert(orderProduct);
                          }

                          setState(() {});

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PaypalScreen(
                                items: items,
                                userId: patientId,
                                narudzbaId: response?.orderHeaderId,
                                iznos: response?.totalPrice,
                              ),
                            ),
                          );
                        },
                  child: const Text("Kupi!"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<int> getPatientId() async {
    final pacijenti = await _korisniciProvider.get();

    final pacijent = pacijenti.result.firstWhere(
      (korisnik) => korisnik.username == Authorization.username,
    );

    return pacijent.userId;
  }
}
