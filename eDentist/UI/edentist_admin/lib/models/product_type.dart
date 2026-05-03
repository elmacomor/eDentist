import 'package:json_annotation/json_annotation.dart';

part "product_type.g.dart";

@JsonSerializable()
class ProductType {
  int typeId;
  String? typeName;

  ProductType(this.typeId, this.typeName);

  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}
