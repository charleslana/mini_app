import 'package:get_storage/get_storage.dart';
import 'package:mini_app/src/models/tier_list_model.dart';

class TierListService {
  final GetStorage _box = GetStorage();
  final String _key = 'tierList';

  TierListModel loadFromBox() {
    final json = _box.read<dynamic>(_key) ?? <String, dynamic>{};
    return TierListModel.fromJson(json);
  }

  void saveToBox(TierListModel tierListModel) {
    _box.write(_key, tierListModel.toJson());
  }
}
