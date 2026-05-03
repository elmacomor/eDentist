import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:edentist_mobile/models/appointment.dart';
import 'package:http/io_client.dart';
import 'base_provider.dart';

class AppointmentsProvider extends BaseProvider<Appointment> {
  AppointmentsProvider() : super("Appointments");

  @override
  Appointment fromJson(data) {
    return Appointment.fromJson(data);
  }

  Future<Appointment> postAppointment(dynamic request) async {
    HttpClient client = HttpClient();
    IOClient? http;
    client.badCertificateCallback = (cert, host, port) => true;
    http = IOClient(client);
    var url = "http://10.0.2.2:7291/Appointments";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var jsonRequest = jsonEncode(request);
    print(jsonRequest);
    var response = await http!.post(uri, headers: headers, body: jsonRequest);
    print("Odgovooor-- $response");
    if (isValidResponse(response)) {
      print("response: ${response.request}");
      var data = jsonDecode(response.body);
      return fromJson(data);
    } else {
      throw Exception("Unknown error");
    }
  }
}
