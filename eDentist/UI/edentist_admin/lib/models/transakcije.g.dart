// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transakcije.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transactions _$TransactionsFromJson(Map<String, dynamic> json) => Transactions(
      json['transkcijaId'] as int,
      json['orderHeaderId'] as int?,
      (json['amount'] as num?)?.toDouble(),
      json['transactionStatus'] as String?,
      json['transId'] as String?,
      json['userId'] as int?,
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
    );

Map<String, dynamic> _$TransactionsToJson(Transactions instance) =>
    <String, dynamic>{
      'transkcijaId': instance.transkcijaId,
      'orderHeaderId': instance.orderHeaderId,
      'amount': instance.amount,
      'transactionStatus': instance.transactionStatus,
      'transId': instance.transId,
      'userId': instance.userId,
      'datum': instance.datum?.toIso8601String(),
    };
