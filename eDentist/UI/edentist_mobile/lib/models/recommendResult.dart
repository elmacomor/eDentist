import 'package:json_annotation/json_annotation.dart';

part 'recommendResult.g.dart';

@JsonSerializable()
class RecommendResult {
  int id;
  int? proizvodId;
  int? prviProizvodId;
  int? drugiProizvodId;
  int? treciProizvodId;

  RecommendResult(
      this.id, this.proizvodId, this.drugiProizvodId, this.treciProizvodId);

  factory RecommendResult.fromJson(Map<String, dynamic> json) =>
      _$RecommendResultFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendResultToJson(this);
}
