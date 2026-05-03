
import 'package:edentist_mobile/models/transakcijaZaUslugu.dart';

import 'base_provider.dart';

class TransakcijaZaUsluguProvider extends BaseProvider<TransakcijaZaUslugu> {
  TransakcijaZaUsluguProvider() : super("TransakcijaZaUslugu");

  @override
  TransakcijaZaUslugu fromJson(data) {
    return TransakcijaZaUslugu.fromJson(data);
  }
}
