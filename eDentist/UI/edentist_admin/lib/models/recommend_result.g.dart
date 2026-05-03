// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendResult _$RecommendResultFromJson(Map<String, dynamic> json) =>
    RecommendResult(
      json['id'] as int,
      json['proizvodId'] as int?,
      json['drugiProizvodId'] as int?,
      json['treciProizvodId'] as int?,
    )..prviProizvodId = json['prviProizvodId'] as int?;

Map<String, dynamic> _$RecommendResultToJson(RecommendResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proizvodId': instance.proizvodId,
      'prviProizvodId': instance.prviProizvodId,
      'drugiProizvodId': instance.drugiProizvodId,
      'treciProizvodId': instance.treciProizvodId,
    };
