import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part "transakcija.g.dart";

@JsonSerializable()
class Transakcija {
  int? transkcijaId;
  int? orderHeaderId;
  int? amount;
  String? transactionStatus;
  String? transId;
  int? userId;
  DateTime? datum;
  Transakcija(this.transkcijaId, this.orderHeaderId, this.amount,
      this.transactionStatus, this.transId, this.userId, this.datum);

  factory Transakcija.fromJson(Map<String, dynamic> json) =>
      _$TransakcijaFromJson(json);
  Map<String, dynamic> toJson() => _$TransakcijaToJson(this);
}
