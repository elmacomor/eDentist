// ignore_for_file: prefer_const_constructors
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/blog_list_screen.dart';
import 'package:edentist_mobile/screens/cart_screen.dart';
import 'package:edentist_mobile/screens/favorites_screen.dart';
import 'package:edentist_mobile/screens/login_screen.dart';
import 'package:edentist_mobile/screens/medicalCard_page.dart';
import 'package:edentist_mobile/screens/pregled_transakcijaZaUsluge.dart';
import 'package:edentist_mobile/screens/termini_page.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterScreenWidget extends StatefulWidget {
  Widget? child;
  String? title;
  Widget? titleWidget;

  MasterScreenWidget({this.child, this.title, this.titleWidget, Key? key})
      : super(key: key);

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  late UserProvider _korisniciProvider;
  late User pacijent;

  @override
  void initState() {
    super.initState();
    _korisniciProvider = context.read<UserProvider>();
    this.getPatient();
  }

  void getPatient() async {
    final pacijenti = await _korisniciProvider.get();

    pacijent = pacijenti.result
        .firstWhere((korisnik) => korisnik.username == Authorization.username);
  }

 void _showLoginMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log In Required'),
        content: Text('Logirajte se kako bi mogli nastaviti.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: widget.titleWidget ?? Text(widget.title ?? ""),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.black,
            ),
            onPressed: LoggedIn.isLoggedIn
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FavoritesScreen(),
                      ),
                    );
                  }
                : () {
                    _showLoginMessage(context);
                  },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: LoggedIn.isLoggedIn
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ),
                    );
                  }
                : () {
                    _showLoginMessage(context);
                  },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Termini'),
              onTap: LoggedIn.isLoggedIn
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TerminiPage(),
                      ),
                    );
                  }
                : () {
                    _showLoginMessage(context);
                  },
            ),
            ListTile(
              title: Text('Blog'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlogListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Moj karton'),
              onTap:LoggedIn.isLoggedIn
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MedicalCardPage(user: pacijent),
                      ),
                    );
                  }
                : () {
                    _showLoginMessage(context);
                  },
            ),
             ListTile(
              title: Text('Moje uplate'),
              onTap: LoggedIn.isLoggedIn
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PregledTransakcijaScreen(),
                      ),
                    );
                  }
                : () {
                    _showLoginMessage(context);
                  },
            ),
             LoggedIn.isLoggedIn ? ListTile(
              title: Text('Odjavi se'),
              onTap: () {
                final korisniciProvider =
                    Provider.of<UserProvider>(context, listen: false);
                korisniciProvider.logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              },
            ):ListTile(
              title: Text('Log In'),
              onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}
