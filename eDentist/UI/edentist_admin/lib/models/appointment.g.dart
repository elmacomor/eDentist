// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
      json['appointmentID'] as int?,
      json['userId'] as int?,
      DateTime.parse(json['datum'] as String),
      json['vrijeme'] as String?,
      json['terminZatvoren'] as bool,
      json['userIdDentist'] as int?,
    );

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'appointmentID': instance.appointmentID,
      'userId': instance.userId,
      'datum': instance.datum.toIso8601String(),
      'vrijeme': instance.vrijeme,
      'terminZatvoren': instance.terminZatvoren,
      'userIdDentist': instance.userIdDentist,
    };
