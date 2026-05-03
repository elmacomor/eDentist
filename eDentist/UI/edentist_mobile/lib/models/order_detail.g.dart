// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      (json['orderHeaderId'] as num?)?.toInt(),
      (json['productId'] as num?)?.toInt(),
      (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'productId': instance.productId,
      'quantity': instance.quantity,
      'orderHeaderId': instance.orderHeaderId,
    };
