import 'package:eprodaja_admin/models/appointment.dart';

import 'base_provider.dart';

class AppointmentsProvider extends BaseProvider<Appointment> {
  AppointmentsProvider() : super("Appointments");

  @override
  Appointment fromJson(data) {
    return Appointment.fromJson(data);
  }
}
