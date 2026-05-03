// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendResult _$RecommendResultFromJson(Map<String, dynamic> json) =>
    RecommendResult(
      (json['id'] as num).toInt(),
      (json['proizvodId'] as num?)?.toInt(),
      (json['drugiProizvodId'] as num?)?.toInt(),
      (json['treciProizvodId'] as num?)?.toInt(),
    )..prviProizvodId = (json['prviProizvodId'] as num?)?.toInt();

Map<String, dynamic> _$RecommendResultToJson(RecommendResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proizvodId': instance.proizvodId,
      'prviProizvodId': instance.prviProizvodId,
      'drugiProizvodId': instance.drugiProizvodId,
      'treciProizvodId': instance.treciProizvodId,
    };
