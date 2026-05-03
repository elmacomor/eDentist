import 'package:eprodaja_admin/models/color.dart';
import 'package:eprodaja_admin/models/login.dart';

import 'base_provider.dart';

class LogInProvider extends BaseProvider<LogIn> {
  LogInProvider() : super("Users/login");

  @override
  LogIn fromJson(data) {
    return LogIn.fromJson(data);
  }
}
