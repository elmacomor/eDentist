import 'package:edentist_mobile/models/favorite.dart';

import 'base_provider.dart';

class FavoritesProvider extends BaseProvider<Favorite> {
  FavoritesProvider() : super("Favorites");

  Future<bool> exists(int productId) async {
    final favorites = await get();
    List<Favorite> result = favorites.result;
    for (var p in result) {
      if (p.productId == productId) {
        return true;
      }
    }
    return false;
  }

  @override
  Favorite fromJson(data) {
    return Favorite.fromJson(data);
  }
}
