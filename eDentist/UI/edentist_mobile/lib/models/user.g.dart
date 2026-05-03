// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      (json['userId'] as num).toInt(),
      (json['roleID'] as num).toInt(),
      json['name'] as String?,
      json['surname'] as String?,
      json['email'] as String?,
      json['username'] as String?,
      json['adress'] as String?,
      (json['cityId'] as num).toInt(),
      json['slika'] as String?,
      json['password'] as String?,
      json['repeatPassword'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'roleID': instance.roleID,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'username': instance.username,
      'adress': instance.adress,
      'cityId': instance.cityId,
      'slika': instance.slika,
      'password': instance.password,
      'repeatPassword': instance.repeatPassword,
    };
