import 'package:edentist_mobile/models/order_detail.dart';
import 'package:edentist_mobile/providers/base_provider.dart';

class OrderDetailsProvider extends BaseProvider<Order> {
  OrderDetailsProvider() : super("Order");

  @override
  Order fromJson(data) {
    return Order.fromJson(data);
  }
}
