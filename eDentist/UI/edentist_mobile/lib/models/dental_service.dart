import 'package:json_annotation/json_annotation.dart';

part "dental_service.g.dart";

@JsonSerializable()
class DentalService {
  int dentalServiceId;
  String? serviceName;
  String? serviceDescription;
  int servicePrice;

  DentalService(this.dentalServiceId, this.serviceName, this.serviceDescription,
      this.servicePrice);

  factory DentalService.fromJson(Map<String, dynamic> json) =>
      _$DentalServiceFromJson(json);
  Map<String, dynamic> toJson() => _$DentalServiceToJson(this);
}
