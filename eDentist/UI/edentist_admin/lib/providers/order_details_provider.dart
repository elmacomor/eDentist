import 'package:eprodaja_admin/models/order_details.dart';
import 'package:eprodaja_admin/providers/base_provider.dart';

class OrderDetailsProvider extends BaseProvider<Order> {
  OrderDetailsProvider() : super("Order");

  @override
  Order fromJson(data) {
    return Order.fromJson(data);
  }

  Future<List<Order>> getStavkeNarudzbeByNarudzbaId(int narudzbaId) async {
    try {
      var filter = {"orderHeaderId": narudzbaId};
      var result = await get(filter: filter);
      print(result.result);
      return result.result;
    } catch (e) {
      throw Exception('Greška pri dobavljanju stavki narudzbe po id: $e');
    }
  }
}
