// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHeader _$OrderHeaderFromJson(Map<String, dynamic> json) => OrderHeader(
      json['orderHeaderId'] as int,
      json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      json['userId'] as int?,
      json['totalPrice'] as int?,
      json['status'] as String?,
    );

Map<String, dynamic> _$OrderHeaderToJson(OrderHeader instance) =>
    <String, dynamic>{
      'orderHeaderId': instance.orderHeaderId,
      'orderDate': instance.orderDate?.toIso8601String(),
      'userId': instance.userId,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
    };
