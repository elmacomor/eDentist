import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/signup_page.dart';
import 'package:eprodaja_admin/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class PregedZaposlenika extends StatefulWidget {
  @override
  _PregedZaposlenikaPageState createState() => _PregedZaposlenikaPageState();
}

class _PregedZaposlenikaPageState extends State<PregedZaposlenika> {
  final UserProvider _userProvider = UserProvider();

  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var result = await _userProvider.get();
      print(result.result);
      setState(() {
        users = result.result;
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
        title: Text('Zaposlenici', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dodaj zaposlenika',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Table
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Ime')),
                  DataColumn(label: Text('Prezime')),
                ],
                rows: users.where((e) => e.roleID == 1).map((u) {
                  return DataRow(
                    cells: [
                      DataCell(Text(u.name ?? "")),
                      DataCell(Text(u.surname ?? "")),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
