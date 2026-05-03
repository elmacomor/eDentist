import 'package:edentist_mobile/models/dental_service.dart';
import 'package:edentist_mobile/models/transakcijaZaUslugu.dart';
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/dental_service_provider.dart';
import 'package:edentist_mobile/providers/transakcijaZaUslugu_provider.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/paypalService_screen.dart';
import 'package:edentist_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PregledTransakcijaScreen extends StatefulWidget {
  const PregledTransakcijaScreen({Key? key}) : super(key: key);

  @override
  _PregledTransakcijaScreenState createState() => _PregledTransakcijaScreenState();
}

class _PregledTransakcijaScreenState extends State<PregledTransakcijaScreen> {
  late TransakcijaZaUsluguProvider _transactionProvider;
  List<TransakcijaZaUslugu> transakcije = [];
  List<DentalService> dentalServices = [];
  final DentalServiceProvider _dentalServiceProvider = DentalServiceProvider();
  int? _selectedServiceId;
  late UserProvider _korisniciProvider;
  late User pacijent;

  @override
  void initState() {
    super.initState();
    _transactionProvider = Provider.of<TransakcijaZaUsluguProvider>(context, listen: false);
    _fetchTransactions();
    fetchDentalServices();
     _korisniciProvider = context.read<UserProvider>();
    this.getPatient();
  }

    void getPatient() async {
    final pacijenti = await _korisniciProvider.get();

    pacijent = pacijenti.result
        .firstWhere((korisnik) => korisnik.username == Authorization.username);
  }

  Future<void> fetchDentalServices() async {
    try {
      var result = await _dentalServiceProvider.get();
      setState(() {
        dentalServices = result.result;
      });
    } catch (e) {
      print(e);
      setState(() {});
    }
  }

  Future<void> _fetchTransactions() async {
    try {
      var data = await _transactionProvider.get();
      setState(() {
        transakcije = data.result.where((t) => t.userId==pacijent.userId).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  String? getDentalServiceName(int? id) {
    return dentalServices.firstWhere((service) => service.dentalServiceId == id).serviceName;
  }

  Future<void> _showAddTransactionDialog() async {
    final _formKey = GlobalKey<FormState>();
    int? _selectedServiceId;
    int? _amount;
    String? _svrhaUplate;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Dodaj transakciju'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<int>(
                  decoration: InputDecoration(labelText: 'Dentalna usluga'),
                  items: dentalServices.map((service) {
                    return DropdownMenuItem<int>(
                      value: service.dentalServiceId,
                      child: Text(service.serviceName ?? ""),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedServiceId = value;
                  },
                  validator: (value) => value == null ? 'Odaberite uslugu' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Iznos uplate'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _amount = int.tryParse(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Unesite iznos';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Unesite validan iznos';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Svrha uplate'),
                  onChanged: (value) {
                    _svrhaUplate = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Unesite svrhu uplate';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Odustani'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  int userId = pacijent.userId;
                  DateTime datum = DateTime.now();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaypalScreenService(
                        dentalServiceId: _selectedServiceId,
                        amount: _amount,
                        userId: userId,
                        svrha: _svrhaUplate,
                      ),
                    ),
                  );
                  await _fetchTransactions();

                  Navigator.of(context).pop();
                }
              },
              child: Text('Dodaj'),
            ),
          ],
        );
      },
    );
  }

  List<TransakcijaZaUslugu> getFilteredTransactions() {
    if (_selectedServiceId == null) {
      return transakcije;
    }
    return transakcije
        .where((transaction) => transaction.dentalServiceId == _selectedServiceId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregled uplata', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _showAddTransactionDialog,
            child: Text('Dodaj transakciju'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<int>(
              hint: Text('Odaberite uslugu'),
              value: _selectedServiceId,
              onChanged: (newValue) {
                setState(() {
                  _selectedServiceId = newValue;
                });
              },
              items: dentalServices.map((service) {
                return DropdownMenuItem<int>(
                  value: service.dentalServiceId,
                  child: Text(service.serviceName ?? ""),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: _buildBlogList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogList() {
    var filteredTransactions = getFilteredTransactions();

    if (filteredTransactions.isEmpty) {
      return Center(
        child: Text('Nema dostupnih transakcija.'),
      );
    }

    return ListView.builder(
      itemCount: filteredTransactions.length,
      itemBuilder: (context, index) {
        return _buildTransactionCard(filteredTransactions[index]);
      },
    );
  }

  Widget _buildTransactionCard(TransakcijaZaUslugu t) {
    final serviceName = getDentalServiceName(t.dentalServiceId);
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text("Uplata za uslugu: $serviceName"),
            subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Iznos uplate: ${t.amount}, Datum: ${DateFormat('dd.MM.yyyy').format(t.datum ?? DateTime.now())}"),
      Text("Svrha: ${t.svrhaUplate??""}"),
    ],
  ),
          ),
        ],
      ),
    );
  }
}
