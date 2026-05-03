import 'package:eprodaja_admin/models/transakcije.dart';
import 'package:eprodaja_admin/providers/transakcije_provider.dart';
import 'package:eprodaja_admin/screens/reports_page.dart';
import 'package:eprodaja_admin/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  late TransactionsProvider _transactionProvider;
  List<Transactions> transakcije = [];
  int? _selectedYear;
  int? _selectedMonth;
  int userId = 1; // Replace with actual user ID

  List<int> years = List.generate(DateTime.now().year - 2010 + 1, (index) => 2010 + index).reversed.toList();
  List<int> months = List.generate(12, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _transactionProvider = Provider.of<TransactionsProvider>(context, listen: false);
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      var data = await _transactionProvider.get();

      setState(() {
        transakcije = data.result.where((transaction) =>
            (_selectedYear == null || transaction.datum?.year == _selectedYear) &&
            (_selectedMonth == null || transaction.datum?.month == _selectedMonth)
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

Future<void> _savePDFReport(pw.Document pdf, String reportId) async {
  await Printing.layoutPdf(onLayout: (format) async => pdf.save());

  final directory = await getApplicationDocumentsDirectory();
  final reportsPath = '${directory.path}/Reports';
  final file = File('$reportsPath/${userId}_$reportId.pdf');


  final reportsDir = Directory(reportsPath);
  if (!await reportsDir.exists()) {
    await reportsDir.create(recursive: true);
  }

  await file.writeAsBytes(await pdf.save());
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
          Text('Izaberite datum', style: TextStyle(fontSize: 18)),
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
            ],
          ),
          SizedBox(height: 20),
          BlueButton(
            text: 'Kreiraj izvještaj',
            width: 200,
            height: 40,
            onPressed: () async {
              final pdf = await _generatePDFReport();
              final reportId = DateTime.now().millisecondsSinceEpoch.toString();
              await _savePDFReport(pdf, reportId);
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

  Widget _buildBlogCard(Transactions t) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text("Uplata za narudzbu: ${t.orderHeaderId.toString()}"),
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
                final reportId = DateTime.now().millisecondsSinceEpoch.toString();
                await _savePDFReport(pdf, reportId);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<pw.Document> _generateSingleTransactionPDF(Transactions transaction) async {
    final pdf = pw.Document();

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
                  _generateSingleTransactionPDFContent(transaction),
                ],
              ),
            ),
          );
        },
      ),
    );

    return pdf;
  }

  pw.Widget _generateSingleTransactionPDFContent(Transactions transaction) {
    return pw.Column(
      children: [
        pw.Row(
          children: [
            pw.Text('Narudzba: ${transaction.orderHeaderId}'),
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
        ? 'Pregled svih transakcija za mjesec: $_selectedMonth godina: $_selectedYear'
        : (_selectedMonth != null ? 'Pregled svih uplata za mjesec: $_selectedMonth' : (_selectedYear != null ? 'Pregled svih uplata za godinu: $_selectedYear' : 'Pregled svih uplata'));

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

  pw.Widget _generatePDFContent() {
    return pw.Column(
      children: transakcije.map((e) => pw.Column(
        children: [
          pw.Row(
            children: [
              pw.Text('Narudzba: ${e.orderHeaderId}'),
            ],
          ),
          pw.Row(
            children: [
              pw.Text('Iznos transakcije: ${e.amount}'),
            ],
          ),
        ],
      )).toList(),
    );
  }
}
