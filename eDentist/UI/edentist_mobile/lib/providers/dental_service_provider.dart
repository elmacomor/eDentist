import 'package:edentist_mobile/models/dental_service.dart';

import 'base_provider.dart';

class DentalServiceProvider extends BaseProvider<DentalService> {
  DentalServiceProvider() : super("DentalService");

  @override
  DentalService fromJson(data) {
    return DentalService.fromJson(data);
  }
}
