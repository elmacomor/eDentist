import 'package:eprodaja_admin/models/transakcije.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';

class TransactionsProvider extends BaseProvider<Transactions> {
  TransactionsProvider() : super("Transactions");

  @override
  Transactions fromJson(data) {
    return Transactions.fromJson(data);
  }
}
