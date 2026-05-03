import 'package:json_annotation/json_annotation.dart';

part 'medical_card.g.dart';

@JsonSerializable()
class MedicalCard {
  int medicalCardId;
  int userId;
  int? dentalServiceId;
  String? doctorsOppinion;
  DateTime datumDijagnoze;

  MedicalCard(this.medicalCardId, this.userId, this.dentalServiceId,
      this.doctorsOppinion, this.datumDijagnoze);

  factory MedicalCard.fromJson(Map<String, dynamic> json) =>
      _$MedicalCardFromJson(json);

  Map<String, dynamic> toJson() => _$MedicalCardToJson(this);
}
