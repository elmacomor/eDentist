import 'package:edentist_mobile/models/user.dart';
import 'package:edentist_mobile/utils/util.dart';

import 'base_provider.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super("Users");

  @override
  User fromJson(data) {
    return User.fromJson(data);
  }

  void logout() {
    Authorization.username = null;
    Authorization.password = null;
    LoggedIn.isLoggedIn=false;
  }
}
