import 'package:eprodaja_admin/models/dental_service.dart';
import 'package:eprodaja_admin/models/transakcijaZaUslugu.dart';
import 'package:eprodaja_admin/providers/dentalService_provider.dart';
import 'package:eprodaja_admin/providers/transakcijaZaUslugu_provider.dart';
import 'package:eprodaja_admin/screens/reports_page.dart';
import 'package:eprodaja_admin/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;

class TransactionsForServicePage extends StatefulWidget {
  const TransactionsForServicePage({Key? key}) : super(key: key);

  @override
  _TransactionsForServicePageState createState() => _TransactionsForServicePageState();
}

class _TransactionsForServicePageState extends State<TransactionsForServicePage> {
  late TransakcijaZaUsluguProvider _transactionProvider;
  List<TransakcijaZaUslugu> transakcije = [];
  List<DentalService> dentalServices = [];
  final DentalServiceProvider _dentalServiceProvider = DentalServiceProvider();
  int? _selectedYear;
  int? _selectedMonth;
  int? _selectedDentalServiceId;

  List<int> years = List.generate(DateTime.now().year - 2010 + 1, (index) => 2010 + index).reversed.toList();
  List<int> months = List.generate(12, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _transactionProvider = Provider.of<TransakcijaZaUsluguProvider>(context, listen: false);
    _fetchTransactions();
    fetchDentalServices();
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
        transakcije = data.result.where((transaction) =>
            (_selectedYear == null || transaction.datum?.year == _selectedYear) &&
            (_selectedMonth == null || transaction.datum?.month == _selectedMonth) &&
            (_selectedDentalServiceId == null || transaction.dentalServiceId == _selectedDentalServiceId)
        ).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  void _onYearChanged(int? year) {
    setState(() {
      _selectedYear = year;
    });
    _fetchTransactions();
  }

  void _onMonthChanged(int? month) {
    setState(() {
      _selectedMonth = month;
    });
    _fetchTransactions();
  }

  void _onDentalServiceChanged(int? id) {
    setState(() {
      _selectedDentalServiceId = id;
    });
    _fetchTransactions();
  }

  String _getDentalServiceName(int id) {
    final service = dentalServices.firstWhere((service) => service.dentalServiceId == id);
    return service.serviceName ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista transakcija', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          ElevatedButton(
            child: Text("Otvori reporte"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text('Izaberite datum i uslugu', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                hint: Text('Godina', style: TextStyle(color: Colors.black)),
                value: _selectedYear,
                onChanged: _onYearChanged,
                items: [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('All'),
                  ),
                  ...years.map((year) {
                    return DropdownMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    );
                  }).toList(),
                ],
              ),
              SizedBox(width: 16),
              DropdownButton<int>(
                hint: Text('Mjesec', style: TextStyle(color: Colors.black)),
                value: _selectedMonth,
                onChanged: _onMonthChanged,
                items: [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('All'),
                  ),
                  ...months.map((month) {
                    return DropdownMenuItem<int>(
                      value: month,
                      child: Text(month.toString()),
                    );
                  }).toList(),
                ],
              ),
              SizedBox(width: 16),
              DropdownButton<int>(
                hint: Text('Usluga', style: TextStyle(color: Colors.black)),
                value: _selectedDentalServiceId,
                onChanged: _onDentalServiceChanged,
                items: [
                  DropdownMenuItem<int>(
                    value: null,
                    child: Text('All'),
                  ),
                  ...dentalServices.map((service) {
                    return DropdownMenuItem<int>(
                      value: service.dentalServiceId,
                      child: Text(service.serviceName ?? ""),
                    );
                  }).toList(),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          BlueButton(
            text: 'Kreiraj izvještaj',
            width: 200,
            height: 40,
            onPressed: () async {
              final pdf = await _generatePDFReport();
              await _printPDFReport(pdf);
            },
          ),
          Expanded(
            child: _buildBlogList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogList() {
    if (transakcije.isEmpty) {
      return Center(
        child: Text('Nema dostupnih transakcija.'),
      );
    }

    return ListView.builder(
      itemCount: transakcije.length,
      itemBuilder: (context, index) {
        return _buildBlogCard(transakcije[index]);
      },
    );
  }

  Widget _buildBlogCard(TransakcijaZaUslugu t) {
    final serviceName = _getDentalServiceName(t.dentalServiceId ?? 0);

    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text("Uplata za uslugu: $serviceName"),
            subtitle: Text("Iznos uplate: ${t.amount}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlueButton(
              text: 'Print',
              width: 80,
              height: 30,
              onPressed: () async {
                final pdf = await _generateSingleTransactionPDF(t);
                await _printPDFReport(pdf);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<pw.Document> _generateSingleTransactionPDF(TransakcijaZaUslugu transaction) async {
    final pdf = pw.Document();
    final serviceName = _getDentalServiceName(transaction.dentalServiceId ?? 0);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black, width: 2),
              ),
              padding: pw.EdgeInsets.all(20),
              child: pw.Column(
                children: [
                  pw.Text('Detalji transakcije', style: pw.TextStyle(fontSize: 20)),
                  pw.SizedBox(height: 20),
                  _generateSingleTransactionPDFContent(transaction, serviceName),
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf;
  }

  pw.Widget _generateSingleTransactionPDFContent(TransakcijaZaUslugu transaction, String serviceName) {
    return pw.Column(
      children: [
        pw.Row(
          children: [
            pw.Text('Usluga: $serviceName'),
          ],
        ),
        pw.Row(
          children: [
            pw.Text('Iznos transakcije: ${transaction.amount}'),
          ],
        ),
        pw.Row(
          children: [
            pw.Text('Status transakcije: ${transaction.transactionStatus}'),
          ],
        ),
        pw.Row(
          children: [
            pw.Text('Id transakcije: ${transaction.transId}'),
          ],
        ),
      ],
    );
  }

  Future<pw.Document> _generatePDFReport() async {
    final pdf = pw.Document();
    final totalAmount = transakcije.fold<double>(0, (sum, item) => sum + (item.amount ?? 0));

    final String headerText = _selectedMonth != null && _selectedYear != null
        ? 'Pregled svih transakcija za usluge za mjesec: $_selectedMonth godina: $_selectedYear'
        : (_selectedMonth != null ? 'Pregled svih uplata za usluge za mjesec: $_selectedMonth' : (_selectedYear != null ? 'Pregled svih uplata za usluge za godinu: $_selectedYear' : 'Pregled svih uplata za usluge'));

    final String dentalServiceHeader = _selectedDentalServiceId != null 
        ? 'Usluga: ${_getDentalServiceName(_selectedDentalServiceId!)}' 
        : '';

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Container(
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black, width: 2),
              ),
              padding: pw.EdgeInsets.all(20),
              child: pw.Column(
                children: [
                  pw.Text(headerText, style: pw.TextStyle(fontSize: 20)),
                  if (_selectedDentalServiceId != null) pw.Text(dentalServiceHeader, style: pw.TextStyle(fontSize: 18)),
                  pw.SizedBox(height: 20),
                  pw.Text('Ukupno: ${totalAmount}', style: pw.TextStyle(fontSize: 18)),
                  pw.SizedBox(height: 20),
                  _generatePDFContent(),
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf;
  }

  Future<void> _printPDFReport(pw.Document pdf) async {
    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
    );
  }

  pw.Widget _generatePDFContent() {
    return pw.Column(
      children: transakcije.map((e) {
        final serviceName = _getDentalServiceName(e.dentalServiceId ?? 0);
        return pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Text('Narudzba: $serviceName'),
              ],
            ),
            pw.Row(
              children: [
                pw.Text('Iznos transakcije: ${e.amount}'),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
