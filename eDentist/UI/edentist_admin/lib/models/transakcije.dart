import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'transakcije.g.dart';

@JsonSerializable()
class Transactions {
  int transkcijaId;
  int? orderHeaderId;
  double? amount;
  String? transactionStatus;
  String? transId;
  int? userId;
  DateTime? datum;
  Transactions(this.transkcijaId, this.orderHeaderId, this.amount,
      this.transactionStatus, this.transId,this.userId,this.datum);

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);
}
