import 'package:edentist_mobile/models/appointment.dart';
import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/providers/user_provider.dart';
import 'package:edentist_mobile/screens/termin_details_screen.dart';
import 'package:flutter/material.dart';

class ChooseDoctorScreen extends StatefulWidget {
  final Appointment? termin;

  ChooseDoctorScreen({Key? key, this.termin}) : super(key: key);

  @override
  _ChooseDoctorPageState createState() => _ChooseDoctorPageState();
}

class _ChooseDoctorPageState extends State<ChooseDoctorScreen> {
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

  void _navigateToAddAppointmentPage(int userId) {
    Navigator.pushReplacement(
  context,
 MaterialPageRoute(
        builder: (context) => AddAppointmentPage(termin: widget.termin, doctorId: userId),
      ),
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Odaberi ljekara', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.where((e) => e.roleID == 1).length,
              itemBuilder: (context, index) {
                final user = users.where((e) => e.roleID == 1).elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _navigateToAddAppointmentPage(user.userId!);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '${user.name ?? ""} ${user.surname ?? ""}',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
