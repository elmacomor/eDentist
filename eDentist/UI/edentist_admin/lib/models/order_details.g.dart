// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['orderId'] as int?,
      json['orderHeaderId'] as int?,
      json['productId'] as int?,
      json['quantity'] as int?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'productId': instance.productId,
      'quantity': instance.quantity,
      'orderHeaderId': instance.orderHeaderId,
    };
