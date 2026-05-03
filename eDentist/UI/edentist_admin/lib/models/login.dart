import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LogIn {
  String? Username;
  String? Password;

  LogIn(this.Username, this.Password);

  factory LogIn.fromJson(Map<String, dynamic> json) => _$LogInFromJson(json);

  Map<String, dynamic> toJson() => _$LogInToJson(this);
}
