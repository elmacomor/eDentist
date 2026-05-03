
import 'package:json_annotation/json_annotation.dart';

part "transakcijaZaUslugu.g.dart";

@JsonSerializable()
class TransakcijaZaUslugu {
  int? transkcijaId;
  int? dentalServiceId;
  int? amount;
  String? transactionStatus;
  String? transId;
  int? userId;
  DateTime? datum;
  String? svrhaUplate;
  TransakcijaZaUslugu(this.transkcijaId, this.dentalServiceId, this.amount,
      this.transactionStatus, this.transId, this.userId, this.datum,this.svrhaUplate);

  factory TransakcijaZaUslugu.fromJson(Map<String, dynamic> json) =>
      _$TransakcijaZaUsluguFromJson(json);
  Map<String, dynamic> toJson() => _$TransakcijaZaUsluguToJson(this);
}
