// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transakcija.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transakcija _$TransakcijaFromJson(Map<String, dynamic> json) => Transakcija(
      (json['transkcijaId'] as num?)?.toInt(),
      (json['orderHeaderId'] as num?)?.toInt(),
      (json['amount'] as num?)?.toInt(),
      json['transactionStatus'] as String?,
      json['transId'] as String?,
      (json['userId'] as num?)?.toInt(),
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
    );

Map<String, dynamic> _$TransakcijaToJson(Transakcija instance) =>
    <String, dynamic>{
      'transkcijaId': instance.transkcijaId,
      'orderHeaderId': instance.orderHeaderId,
      'amount': instance.amount,
      'transactionStatus': instance.transactionStatus,
      'transId': instance.transId,
      'userId': instance.userId,
      'datum': instance.datum?.toIso8601String(),
    };
