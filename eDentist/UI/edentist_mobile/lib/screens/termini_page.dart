import 'package:edentist_mobile/models/appointment.dart';
import 'package:edentist_mobile/providers/appointment_provider.dart';
import 'package:edentist_mobile/screens/choose_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      var appointmentsData = await _terminiProvider.get();
      setState(() {
        _termin = appointmentsData.result;
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
        title: Text('Termini', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              _navigateToTerminDetailScreen(null);
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
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildDataListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildDataListView() {
    if (_termin.isEmpty) {
      return Center(child: Text('Nema zakazanih termina'));
    }

    return ListView.builder(
      itemCount: _termin.length,
      itemBuilder: (context, index) {
        final termin = _termin[index];
        final now = DateTime.now();
        final isPast = termin.datum.isBefore(now);

        return ListTile(
          title: Text(DateFormat('dd.MM.yyyy - HH:mm').format(termin.datum)),
          subtitle: Text('Vrijeme: ${DateFormat('HH:mm').format(termin.datum)}'),
          trailing: isPast
              ? Text('Zatvoren', style: TextStyle(color: Colors.red))
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _showDeleteConfirmationDialog(termin);
                      },
                      icon: Icon(Icons.cancel, color: Colors.red),
                    ),
                    IconButton(
                      onPressed: () {
                        _navigateToTerminDetailScreen(termin);
                      },
                      icon: Icon(Icons.edit, color: Colors.blue),
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _navigateToTerminDetailScreen(Appointment? termin) async {
    final modifiedTermin = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChooseDoctorScreen(termin: termin),
      ),
    );

    if (modifiedTermin != null && modifiedTermin is Appointment) {
      setState(() {
        int index = _termin.indexWhere((element) => element.appointmentID == modifiedTermin.appointmentID);
        if (index != -1) {
          _termin[index] = modifiedTermin;
        } else {
          _termin.add(modifiedTermin);
        }
      });
    }
  }

  void _showDeleteConfirmationDialog(Appointment termin) {
    final now = DateTime.now();
    final daysDifference = termin.datum.difference(now).inDays;

    if (daysDifference < 4) {
      _showContactDoctorDialog();
    } else {
      _showStandardDeleteDialog(termin);
    }
  }

  void _showStandardDeleteDialog(Appointment termin) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Potvrdi otkazivanje'),
          content: Text('Da li želite otkazati dati termin'),
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
              child: Text('Otkaži'),
            ),
          ],
        );
      },
    );
  }

  void _showContactDoctorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ne može se otkazati termin'),
          content: Text('Za otkazivanje termina unutar 4 dana prije termina, molimo kontaktirajte svog doktora.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('U redu'),
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
        _termin.removeWhere((item) => item.appointmentID == termin.appointmentID);
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
