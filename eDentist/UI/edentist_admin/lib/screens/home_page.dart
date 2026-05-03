import 'package:eprodaja_admin/models/transakcijaZaUslugu.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/blog_screen.dart';
import 'package:eprodaja_admin/screens/dental_service_page.dart';
import 'package:eprodaja_admin/screens/login_page.dart';
import 'package:eprodaja_admin/screens/medical_card_page.dart';
import 'package:eprodaja_admin/screens/orders_list_screen.dart';
import 'package:eprodaja_admin/screens/patients_page.dart';
import 'package:eprodaja_admin/screens/pregled_zaposlenika.dart';
import 'package:eprodaja_admin/screens/products_page.dart';
import 'package:eprodaja_admin/screens/termini_page.dart';
import 'package:eprodaja_admin/screens/transactions_screen.dart';
import 'package:eprodaja_admin/screens/transakcija_za_uslugu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dobrodošli', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              final korisniciProvider =
                  Provider.of<UserProvider>(context, listen: false);
              korisniciProvider.logout();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
              );
            },
          ),
          Text('Odjava', style: TextStyle(color: Colors.white)),
          SizedBox(width: 25)
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlueButton(
                    text: 'Pregled narudžbi',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersListScreen(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled termina',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TerminiPage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled lječničkih kartona',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientsPage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Usluge',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DentalServicesPage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled proizvoda',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductsPage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled članaka',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogListPage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled uplata za narudzbe',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionsPage(),
                        ),
                      );
                    },
                  ),
                   BlueButton(
                    text: 'Pregled uplata za usluge',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TransactionsForServicePage(),
                        ),
                      );
                    },
                  ),
                  BlueButton(
                    text: 'Pregled zaposlenika',
                    height: 80.0,
                    width: double.infinity,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PregedZaposlenika(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          //Logo
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 800,
                width: 800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
