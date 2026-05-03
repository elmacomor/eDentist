import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int productId;
  String? productName;
  String? barcode;
  String? productDescription;
  int productPrice;
  String? slika;
  int productTypeId;

  Product(
    this.productId,
    this.productName,
    this.barcode,
    this.productDescription,
    this.productPrice,
    this.slika,
    this.productTypeId,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
