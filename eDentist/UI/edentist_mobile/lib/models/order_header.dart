import 'package:json_annotation/json_annotation.dart';

part 'order_header.g.dart';

@JsonSerializable()
class OrderHeader {
  int orderHeaderId;
  DateTime? orderDate;
  int? userId;
  int? totalPrice;

  OrderHeader(this.orderHeaderId, this.orderDate, this.userId, this.totalPrice);

  factory OrderHeader.fromJson(Map<String, dynamic> json) =>
      _$OrderHeaderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderHeaderToJson(this);
}
