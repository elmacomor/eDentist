import 'package:eprodaja_admin/models/order_header.dart';
import 'package:eprodaja_admin/models/transakcije.dart';
import 'package:eprodaja_admin/providers/orders_provider.dart';
import 'package:eprodaja_admin/providers/transakcije_provider.dart';
import 'package:eprodaja_admin/screens/completed_orders.dart';
import 'package:eprodaja_admin/screens/order_details.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrdersListScreen extends StatefulWidget {
  const OrdersListScreen({Key? key}) : super(key: key);

  @override
  State<OrdersListScreen> createState() => _OrdersListScreenState();
}

class _OrdersListScreenState extends State<OrdersListScreen> {
  final OrderProvider _ordersProvider = OrderProvider();
  List<OrderHeader> _narudzba = [];
  bool isLoading = true;
  late TransactionsProvider _transactionsProvider = TransactionsProvider();
  List<Transactions> transactions = [];

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    try {
      await _fetchTransactions();
      await _fetchNarudzbe();
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchNarudzbe() async {
    try {
      var result = await _ordersProvider.get();
      var filteredOrders =
          result.result.where((order) => order.status == null).toList();
      for (var order in filteredOrders) {
        for (var t in transactions) {
          if (order.orderHeaderId == t.orderHeaderId) {
            _narudzba.add(order);
          }
        }
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchTransactions() async {
    try {
      var data = await _transactionsProvider.get();

      setState(() {
        transactions = data.result.toList();
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
        title: Text('Narudzbe', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          _buildBigBlueButton(),
          SizedBox(height: 16),
          _buildDataListView(),
        ],
      ),
    );
  }

  Widget _buildBigBlueButton() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CompletedOrdersScreen(),
          ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Pregledaj obrađene narudžbe',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDataListView() {
    if (isLoading) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_narudzba.isEmpty) {
      return Expanded(
        child: Center(
          child: Text('Trenutno nema narudžbi'),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: _narudzba.length,
        itemBuilder: (context, index) {
          var narudzba = _narudzba[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  onTap: () async {
                    var refresh =
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailsScreen(narudzba: narudzba),
                    ));
                    if (refresh == 'reload') {
                      _fetchNarudzbe();
                    }
                  },
                  title: Text(narudzba.orderHeaderId.toString() ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(narudzba.totalPrice.toString() ?? ''),
                      SizedBox(height: 8),
                      Text(
                        'Kreirana: ${narudzba.orderDate != null ? DateFormat('yyyy-MM-dd').format(narudzba.orderDate!) : 'Nepoznat datum'}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
