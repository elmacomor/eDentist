// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicalCard _$MedicalCardFromJson(Map<String, dynamic> json) => MedicalCard(
      (json['medicalCardId'] as num).toInt(),
      (json['userId'] as num).toInt(),
      (json['dentalServiceId'] as num?)?.toInt(),
      json['doctorsOppinion'] as String?,
      DateTime.parse(json['datumDijagnoze'] as String),
    );

Map<String, dynamic> _$MedicalCardToJson(MedicalCard instance) =>
    <String, dynamic>{
      'medicalCardId': instance.medicalCardId,
      'userId': instance.userId,
      'dentalServiceId': instance.dentalServiceId,
      'doctorsOppinion': instance.doctorsOppinion,
      'datumDijagnoze': instance.datumDijagnoze.toIso8601String(),
    };
