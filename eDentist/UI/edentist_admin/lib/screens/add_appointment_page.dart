import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:eprodaja_admin/models/appointment.dart';
import 'package:eprodaja_admin/models/search_result.dart';
import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/providers/appointments_provider.dart';
import 'package:eprodaja_admin/providers/user_provider.dart';
import 'package:eprodaja_admin/utils/util.dart';

class AddAppointmentPage extends StatefulWidget {
  final Appointment? termin;
  final int? selectedPatient;

  AddAppointmentPage({this.termin, this.selectedPatient});

  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  late DateTime _uredjenDatum;
  int? _pacijentId;
  bool _datumUredjivan = false;
  bool _SpasiEnabled = false;
  List<TimeOfDay> _selectableTimes = [];
  late TimeOfDay _selectedTime;

  late UserProvider _korisniciProvider;
  late AppointmentsProvider _terminiProvider;
  SearchResult<User>? result;
  List<Appointment>? _termini;
  int? _selectedPatient;
  List<User>? _korisnici;

  bool get _isEditing => widget.termin != null;

  @override
  void initState() {
    super.initState();
    _korisniciProvider = Provider.of<UserProvider>(context, listen: false);
    _terminiProvider = AppointmentsProvider();
    _uredjenDatum = widget.termin?.datum ?? DateTime.now().add(Duration(days: 3));
    _pacijentId = widget.selectedPatient ?? null;
    _generateSelectableTimes();
    _fetchPacijenti();
    _fetchTerminiForPatient(_selectedPatient ?? _pacijentId ?? -1);
  }
Future<User?> _fetchDoctor() async {
      var userData = await _korisniciProvider.get();
      setState(() {
        _korisnici = userData.result;
      });

      final doctor = _korisnici?.firstWhere(
          (korisnik) => korisnik.username == Authorization.username);

     return doctor;
  }


  void _generateSelectableTimes() {
    final startTime = TimeOfDay(hour: 9, minute: 0);
    final endTime = TimeOfDay(hour: 17, minute: 0);
    final interval = 30;

    var time = startTime;

    while (_timeOfDayToDateTime(time).isBefore(_timeOfDayToDateTime(endTime))) {
      _selectableTimes.add(time);
      time = _addMinutesToTimeOfDay(time, interval);
    }

    _selectedTime = _selectableTimes.first;
  }

  DateTime _timeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  TimeOfDay _addMinutesToTimeOfDay(TimeOfDay time, int minutes) {
    final totalMinutes = time.hour * 60 + time.minute + minutes;
    return TimeOfDay(hour: totalMinutes ~/ 60, minute: totalMinutes % 60);
  }

  Future<void> _fetchPacijenti() async {
    try {
      var data = await _korisniciProvider.get();

      setState(() {
        result = data;
        if (result?.result.isNotEmpty == true) {
          var filteredPatients =
              result!.result.where((x) => x.roleID == 2).toList();

          if (filteredPatients.isNotEmpty) {
            _selectedPatient = _pacijentId ?? filteredPatients[0].userId;
          } else {
            _selectedPatient = null;
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _fetchTerminiForPatient(int patientId) async {
    try {
      var terminiData = await _terminiProvider.get(filter: {
        'korisnikIdPacijent': patientId,
      });
      setState(() {
        _termini = terminiData.result;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Uredi' : 'Dodaj',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            DropdownButton<int>(
              value: _selectedPatient,
              onChanged: _isEditing
                  ? null
                  : (newValue) {
                      setState(() {
                        _selectedPatient = newValue!;
                      });
                    },
              items: result?.result
                      .where((x) => x.roleID == 2)
                      .map<DropdownMenuItem<int>>((User korisnik) {
                    return DropdownMenuItem<int>(
                      value: korisnik.userId,
                      child: Text(korisnik.name!),
                    );
                  }).toList() ??
                  [],
              isExpanded: true,
              disabledHint: Text(_selectedPatient != null
                  ? 'Ounačeni pacijent: $_selectedPatient'
                  : 'Označite pacijenta'),
              style: TextStyle(
                backgroundColor: Colors.blue,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Datum:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              DateFormat('dd.MM.yyyy').format(_uredjenDatum),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                var todayDate = DateTime.now();
                var firstDate = todayDate.add(Duration(days: 3));
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _uredjenDatum,
                  firstDate: firstDate,
                  lastDate: DateTime(2101),
                );

                if (selectedDate != null) {
                  setState(() {
                    _uredjenDatum = DateTime(
                      selectedDate.year,
                      selectedDate.month,
                      selectedDate.day,
                      _selectedTime.hour,
                      _selectedTime.minute,
                    );
                    _datumUredjivan = true;
                    _SpasiEnabled = true;
                  });
                }
              },
              child:
                  Text('Odaberi datum', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              'Vrijeme:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            DropdownButton<TimeOfDay>(
              value: _selectedTime,
              onChanged: (newValue) {
                setState(() {
                  _selectedTime = newValue!;
                  _uredjenDatum = DateTime(
                    _uredjenDatum.year,
                    _uredjenDatum.month,
                    _uredjenDatum.day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  );
                  _SpasiEnabled = true;
                });
              },
              items: _selectableTimes.map<DropdownMenuItem<TimeOfDay>>((time) {
                return DropdownMenuItem<TimeOfDay>(
                  value: time,
                  child: Text(
                    _formatTimeOfDay(time),
                    style: TextStyle(
                      color: _isTimeTaken(time, _uredjenDatum)
                          ? Colors.red
                          : Colors.blue,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _SpasiEnabled
                      ? () {
                          if (_isEditing) {
                            _saveModifiedTermin();
                          } else {
                            _saveNewTermin();
                          }
                        }
                      : null,
                  child: Text('Spremi', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _saveModifiedTermin() async {
    if (_isTimeTaken(_selectedTime, _uredjenDatum)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Zauzet termin'),
            content: Text('Odaberite neki drugi datum.'),
            actions: [
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
    } else {
      widget.termin!.datum = _uredjenDatum;
      widget.termin!.userId = _pacijentId;

      try {
        await AppointmentsProvider()
            .update(widget.termin!.appointmentID!, widget.termin!);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terimin je uspješno uređen'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, widget.termin);
      } catch (e) {
        print(e);
      }
    }
  }

  void _saveNewTermin() async {
    if (_isTimeTaken(_selectedTime, _uredjenDatum)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Termin zauzet'),
            content: Text('Odaberite neko drugo vrjeme'),
            actions: [
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
    } else {
      final doktor=await _fetchDoctor();
      final newTermin = Appointment(
        null,
        _selectedPatient,
        _uredjenDatum,
        "",
        false,
        doktor!.userId
      );

      try {
        final insertedTermin = await AppointmentsProvider().insert(newTermin);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Termin je uspješno dodan'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context, insertedTermin);
      } catch (e) {
        print(e);
      }
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  bool _isTimeTaken(TimeOfDay time, DateTime selectedDate) {
    if (_termini != null) {
      final selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        time.hour,
        time.minute,
      );

      for (var termin in _termini!) {
        if (termin.datum == selectedDateTime) {
          return true;
        }
      }
    }
    return false;
  }
}
