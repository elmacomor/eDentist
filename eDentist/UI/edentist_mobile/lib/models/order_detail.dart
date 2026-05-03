import 'package:json_annotation/json_annotation.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class Order {
  int? productId;
  int? quantity;
  int? orderHeaderId;

  Order(this.orderHeaderId, this.productId, this.quantity);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
