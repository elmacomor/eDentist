import 'package:edentist_mobile/models/order_header.dart';
import 'package:edentist_mobile/providers/base_provider.dart';

class OrderProvider extends BaseProvider<OrderHeader> {
  OrderProvider() : super("OrderHeader");

  @override
  OrderHeader fromJson(data) {
    return OrderHeader.fromJson(data);
  }
}
