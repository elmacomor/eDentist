import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int userId;
  int roleID;
  String? name;
  String? surname;
  String? email;
  String? username;
  String? adress;
  int cityId;
  String? slika;
  String? password;
  String? repeatPassword;

  User(
      this.userId,
      this.roleID,
      this.name,
      this.surname,
      this.email,
      this.username,
      this.adress,
      this.cityId,
      this.slika,
      this.password,
      this.repeatPassword);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
