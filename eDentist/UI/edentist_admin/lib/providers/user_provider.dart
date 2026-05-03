import 'package:eprodaja_admin/models/user.dart';
import 'package:eprodaja_admin/utils/util.dart';

import 'base_provider.dart';
import '../models/product.dart';

class UserProvider extends BaseProvider<User> {
  UserProvider() : super("Users");

  @override
  User fromJson(data) {
    return User.fromJson(data);
  }

  void logout() {
    Authorization.username = null;
    Authorization.password = null;
  }
}
