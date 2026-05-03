// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Favorite _$FavoriteFromJson(Map<String, dynamic> json) => Favorite(
      (json['favoriteId'] as num).toInt(),
      (json['userId'] as num).toInt(),
      (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$FavoriteToJson(Favorite instance) => <String, dynamic>{
      'favoriteId': instance.favoriteId,
      'userId': instance.userId,
      'productId': instance.productId,
    };
