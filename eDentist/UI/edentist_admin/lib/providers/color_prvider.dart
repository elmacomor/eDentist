import 'package:eprodaja_admin/models/color.dart';

import 'base_provider.dart';

class ColorProvider extends BaseProvider<Color> {
  ColorProvider() : super("Color");

  @override
  Color fromJson(data) {
    return Color.fromJson(data);
  }
}
