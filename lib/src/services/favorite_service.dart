import 'package:get_storage/get_storage.dart';
import 'package:mini_app/src/models/favorite_model.dart';

class FavoriteService {
  final GetStorage _box = GetStorage();
  final String _key = 'favorites';

  FavoriteModel loadFromBox() {
    final json = _box.read<dynamic>(_key) ?? <String, dynamic>{};
    return FavoriteModel.fromJson(json);
  }

  void saveToBox(FavoriteModel favoriteModel) {
    _box.write(_key, favoriteModel.toJson());
  }
}
