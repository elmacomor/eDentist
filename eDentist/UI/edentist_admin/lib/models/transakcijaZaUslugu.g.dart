// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transakcijaZaUslugu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransakcijaZaUslugu _$TransakcijaZaUsluguFromJson(Map<String, dynamic> json) =>
    TransakcijaZaUslugu(
      json['transkcijaId'] as int?,
      json['dentalServiceId'] as int?,
      json['amount'] as int?,
      json['transactionStatus'] as String?,
      json['transId'] as String?,
      json['userId'] as int?,
      json['datum'] == null ? null : DateTime.parse(json['datum'] as String),
      json['svrhaUplate'] as String?,
    );

Map<String, dynamic> _$TransakcijaZaUsluguToJson(
        TransakcijaZaUslugu instance) =>
    <String, dynamic>{
      'transkcijaId': instance.transkcijaId,
      'dentalServiceId': instance.dentalServiceId,
      'amount': instance.amount,
      'transactionStatus': instance.transactionStatus,
      'transId': instance.transId,
      'userId': instance.userId,
      'datum': instance.datum?.toIso8601String(),
      'svrhaUplate': instance.svrhaUplate,
    };
