import 'package:edentist_mobile/models/transakcija.dart';

import 'base_provider.dart';

class TransakcijaProvider extends BaseProvider<Transakcija> {
  TransakcijaProvider() : super("Transactions");

  @override
  Transakcija fromJson(data) {
    return Transakcija.fromJson(data);
  }
}
