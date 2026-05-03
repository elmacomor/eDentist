

import 'package:eprodaja_admin/models/transakcijaZaUslugu.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';

class TransakcijaZaUsluguProvider extends BaseProvider<TransakcijaZaUslugu> {
  TransakcijaZaUsluguProvider() : super("TransakcijaZaUslugu");

  @override
  TransakcijaZaUslugu fromJson(data) {
    return TransakcijaZaUslugu.fromJson(data);
  }
}
