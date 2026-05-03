import 'package:edentist_mobile/models/medical_card.dart';

import 'base_provider.dart';

class MedicalCardProvider extends BaseProvider<MedicalCard> {
  MedicalCardProvider() : super("MedicalCard");

  @override
  MedicalCard fromJson(data) {
    return MedicalCard.fromJson(data);
  }
}
