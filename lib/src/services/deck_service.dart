import 'package:get_storage/get_storage.dart';
import 'package:mini_app/src/models/deck_model.dart';

class DeckService {
  final GetStorage _box = GetStorage();
  final String _key = 'decks';

  DeckModel loadFromBox() {
    final json = _box.read<dynamic>(_key) ?? <String, dynamic>{};
    return DeckModel.fromJson(json);
  }

  void saveToBox(DeckModel deckModel) {
    _box.write(_key, deckModel.toJson());
  }
}
