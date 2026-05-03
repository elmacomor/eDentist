// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['productId'] as num).toInt(),
      json['productName'] as String?,
      json['barcode'] as String?,
      json['productDescription'] as String?,
      (json['productPrice'] as num).toInt(),
      json['slika'] as String?,
      (json['productTypeId'] as num).toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'barcode': instance.barcode,
      'productDescription': instance.productDescription,
      'productPrice': instance.productPrice,
      'slika': instance.slika,
      'productTypeId': instance.productTypeId,
    };
