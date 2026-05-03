import 'package:edentist_mobile/models/transakcijaZaUslugu.dart';
import 'package:edentist_mobile/providers/transakcijaZaUslugu_provider.dart';
import 'package:edentist_mobile/screens/cart_screen.dart';
import 'package:edentist_mobile/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:provider/provider.dart';

class PaypalScreenService extends StatefulWidget {
  final int? dentalServiceId;
  final int? amount;
  final int? userId;
  final String? svrha;

  PaypalScreenService(
      {required this.dentalServiceId,
      required this.amount,
      required this.userId,
      required this.svrha,
      super.key});

  @override
  State<PaypalScreenService> createState() => _PaypalScreenServiceState();
}

class _PaypalScreenServiceState extends State<PaypalScreenService> {
  late TransakcijaZaUsluguProvider _transakcijaProvider;

  @override
  void initState() {
    super.initState();
    _transakcijaProvider =
        Provider.of<TransakcijaZaUsluguProvider>(context, listen: false);
    _navigateToPaypalCheckout();
  }

  void _navigateToPaypalCheckout() async {

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
              "total": widget.amount?.toStringAsFixed(2),
              "currency": "USD",
              "details": {
                "subtotal": widget.amount?.toStringAsFixed(2),
                "shipping": '0',
                "shipping_discount": 0,
              },
            },
            "description": "The payment transaction description.",
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
          if (params['data']['state'] == 'approved') {
            TransakcijaZaUslugu request = TransakcijaZaUslugu(
              0,
              widget.dentalServiceId,
              widget.amount,
              params['data']['state'],
              params['data']['id'],
              widget.userId,
              DateTime.now(),
              widget.svrha
            );
            await _transakcijaProvider.insert(request);
            total = 0.00;

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ProductListScreen()),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Uplata je izvrsena.'),
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
}
