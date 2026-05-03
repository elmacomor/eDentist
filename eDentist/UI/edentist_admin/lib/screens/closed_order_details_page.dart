import 'dart:ffi';
import 'dart:math';

import 'package:eprodaja_admin/models/city.dart';
import 'package:eprodaja_admin/models/product.dart';
import 'package:eprodaja_admin/models/transakcije.dart';
import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/providers/city_provider.dart';
import 'package:eprodaja_admin/providers/orders_provider.dart';
import 'package:eprodaja_admin/providers/product_provider.dart';
import 'package:eprodaja_admin/providers/transakcije_provider.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/orders_list_screen.dart';
import 'package:eprodaja_admin/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:eprodaja_admin/models/order_header.dart';
import 'package:provider/provider.dart';
import 'package:eprodaja_admin/providers/order_details_provider.dart';
import 'package:eprodaja_admin/models/order_details.dart';

class ClosedOrderDetailsScreen extends StatefulWidget {
  final OrderHeader narudzba;

  const ClosedOrderDetailsScreen({Key? key, required this.narudzba})
      : super(key: key);

  @override
  _ClosedOrderDetailsScreenState createState() =>
      _ClosedOrderDetailsScreenState();
}

class _ClosedOrderDetailsScreenState extends State<ClosedOrderDetailsScreen> {
  late OrderDetailsProvider _orderDetailsProvider;
  late OrderProvider _orderProvider;
  late ProductProvider _productProvider;
  List<Order> orderDetailsList = [];
  List<Product> productsList = [];
  List<User> users = [];
  bool isLoading = true;
  bool patientLoading = true;
  late UserProvider _korisniciProvider;
  late User pacijent;
  late CityProvider _gradProvider;
  late City grad;

  @override
  void initState() {
    super.initState();
    _orderDetailsProvider =
        Provider.of<OrderDetailsProvider>(context, listen: false);
    _productProvider = Provider.of<ProductProvider>(context, listen: false);
    _orderProvider = Provider.of<OrderProvider>(context, listen: false);
    _korisniciProvider = context.read<UserProvider>();
    _gradProvider = context.read<CityProvider>();
    this.getPatient();
    _fetchOrderItemsAndProducts();
  }

  void getPatient() async {
    final pacijenti = await _korisniciProvider.get();
    final gradovi = await _gradProvider.get();

    pacijent = await pacijenti.result
        .firstWhere((korisnik) => korisnik.userId == widget.narudzba.userId);
    grad = gradovi.result.firstWhere((g) => g.cityId == pacijent.cityId);
    patientLoading = false;
  }

  Future<void> _fetchOrderItemsAndProducts() async {
    try {
      await _fetchOrderItems();
      await _fetchProducts();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchProducts() async {
    try {
      var data = await _productProvider.get();

      setState(() {
        for (var p in data.result) {
          for (var o in orderDetailsList) {
            if (p.productId == o.productId) {
              productsList.add(p);
            }
          }
        }
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchOrderItems() async {
    try {
      var data = await _orderDetailsProvider.get();

      setState(() {
        orderDetailsList = data.result
                .where((o) => o.orderHeaderId == widget.narudzba.orderHeaderId)
                .toList() ??
            [];
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalji narudzbe', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Narudzba: ${widget.narudzba.orderHeaderId}'),
            SizedBox(height: 8),
            Text('Ukupna cijena: ${widget.narudzba.totalPrice}'),
            SizedBox(height: 16),
            patientLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Podaci za slanje:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        Text(
                            'Ime i prezime: ${pacijent.name} ${pacijent.surname}'),
                        SizedBox(height: 16),
                        Text('Adresa: ${pacijent.adress}'),
                        SizedBox(height: 16),
                        Text('Grad: ${grad.cityName}'),
                        SizedBox(height: 16),
                        Text('Poštanski broj: ${grad.zipCode}'),
                        SizedBox(height: 16),
                        Text('E-mail: ${pacijent.email}'),
                      ],
                    ),
                  ),
            SizedBox(height: 16),
            Text(
              'Naruceni proizvodi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            isLoading
                ? CircularProgressIndicator()
                : productsList.isEmpty
                    ? Text('Nema pronađenih proizvoda')
                    : Expanded(
                        child: ListView.builder(
                          itemCount: productsList.length,
                          itemBuilder: (context, index) {
                            var productDetails = productsList[index];
                            return ListTile(
                              title: Text(
                                  'Naziv proizvoda: ${productDetails.productName}'),
                              subtitle: Text(
                                  'Sifra proizvoda: ${productDetails.barcode}'),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
