import 'package:edentist_mobile/models/login.dart';

import 'base_provider.dart';

class LogInProvider extends BaseProvider<LogIn> {
  LogInProvider() : super("Users/login");

  @override
  LogIn fromJson(data) {
    return LogIn.fromJson(data);
  }
}
