// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dental_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DentalService _$DentalServiceFromJson(Map<String, dynamic> json) =>
    DentalService(
      json['dentalServiceId'] as int,
      json['serviceName'] as String?,
      json['serviceDescription'] as String?,
      json['servicePrice'] as int,
    );

Map<String, dynamic> _$DentalServiceToJson(DentalService instance) =>
    <String, dynamic>{
      'dentalServiceId': instance.dentalServiceId,
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
      'servicePrice': instance.servicePrice,
    };
