import 'package:eprodaja_admin/models/appointment.dart';
import 'package:eprodaja_admin/providers/appointments_provider.dart';
import 'package:eprodaja_admin/screens/add_appointment_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TerminiPage extends StatefulWidget {
  const TerminiPage({Key? key}) : super(key: key);

  @override
  State<TerminiPage> createState() => _TerminiPageState();
}

class _TerminiPageState extends State<TerminiPage> {
  final AppointmentsProvider _terminiProvider = AppointmentsProvider();
  List<Appointment> _termin = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTermini();
  }

  Future<void> _fetchTermini() async {
    try {
      var result = await _terminiProvider.get();
      setState(() {
        _termin = result.result;
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
        title: Text('Pregled termina', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              _navigateToTerminDetailScreen(null, null);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Dodaj novi termin',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Center(child: _buildDataListView()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataListView() {
    if (isLoading) {
      return CircularProgressIndicator();
    }

    if (_termin.isEmpty) {
      return Text('Nema zakazanih termina');
    }

    return Container(
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Pacijent')),
              DataColumn(label: Text('Datum')),
              DataColumn(label: Text('Vrijeme')),
              DataColumn(label: Text('Obriši')),
              DataColumn(label: Text('Status')),
            ],
            rows: _termin.map((termin) {
              bool isPast = termin.datum.isBefore(DateTime.now());
              return DataRow(
                cells: [
                  DataCell(Text(termin.userId.toString())),
                  DataCell(Text(
                      DateFormat('dd.MM.yyyy - HH:mm').format(termin.datum))),
                  DataCell(Text(DateFormat('HH:mm').format(termin.datum))),
                  DataCell(
                    ElevatedButton(
                      onPressed: () {
                        _showDeleteConfirmationDialog(termin);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child:
                          Text('Obriši', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  DataCell(
                    isPast
                        ? Text(
                            'Termin zatvoren',
                            style: TextStyle(color: Colors.red),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              _navigateToTerminDetailScreen(
                                  termin, termin.userId);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue),
                            child: Text('Uredi',
                                style: TextStyle(color: Colors.white)),
                          ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _navigateToTerminDetailScreen(
      Appointment? termin, int? selectedPatient) async {
    final modifiedTermin = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddAppointmentPage(
            termin: termin, selectedPatient: selectedPatient),
      ),
    );

    if (modifiedTermin != null && modifiedTermin is Appointment) {
      setState(() {
        int index = _termin.indexWhere(
            (element) => element.appointmentID == modifiedTermin.appointmentID);
        if (index != -1) {
          _termin[index] = modifiedTermin;
        } else {
          _termin.add(modifiedTermin);
        }
      });
    }
  }

  void _showDeleteConfirmationDialog(Appointment termin) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Potvrdi brisanje'),
          content: Text('Da li želite ukloniti dati termin'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Zadrži termin'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteTermin(termin);
                Navigator.of(context).pop();
              },
              child: Text('Obriši'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteTermin(Appointment termin) async {
    try {
      await _terminiProvider.delete(termin.appointmentID);
      setState(() {
        _termin
            .removeWhere((item) => item.appointmentID == termin.appointmentID);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Termin je uspješno obrisan'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Greška pri brisanju termina.'),
        ),
      );
    }
  }
}
