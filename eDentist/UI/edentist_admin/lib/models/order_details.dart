import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';

@JsonSerializable()
class Order {
  int? orderId;
  int? productId;
  int? quantity;
  int? orderHeaderId;

  Order(this.orderId, this.orderHeaderId, this.productId, this.quantity);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
