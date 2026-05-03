import 'package:eprodaja_admin/models/order_header.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';

class OrderProvider extends BaseProvider<OrderHeader> {
  OrderProvider() : super("OrderHeader");

  @override
  OrderHeader fromJson(data) {
    return OrderHeader.fromJson(data);
  }
}
