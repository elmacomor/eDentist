import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/screens/medical_card_page.dart';
import 'package:flutter/material.dart';
import '../widgets/blue_button.dart';

class PatientsPage extends StatefulWidget {
  @override
  _PatientsPageState createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  final UserProvider _userProvider = UserProvider();

  List<User> users = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

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

  List<User> getFilteredUsers(String searchTerm) {
    return users
        .where((e) =>
            e.roleID == 2 &&
            (e.name!.toLowerCase().contains(searchTerm.toLowerCase()) ||
                e.surname!.toLowerCase().contains(searchTerm.toLowerCase())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacijenti', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Pretraži pacijente',
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Ime')),
                  DataColumn(label: Text('Prezime')),
                  DataColumn(label: Text('Uredi')),
                ],
                rows: getFilteredUsers(searchController.text).map((u) {
                  return DataRow(
                    cells: [
                      DataCell(Text(u.name ?? "")),
                      DataCell(Text(u.surname ?? "")),
                      DataCell(
                        BlueButton(
                          text: "Pregledaj",
                          width: double.infinity,
                          height: 80,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MedicalCardPage(user: u),
                              ),
                            );
                          },
                        ),
                      ),
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
