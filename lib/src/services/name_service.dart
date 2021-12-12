import 'package:get_storage/get_storage.dart';

class NameService {
  final GetStorage _box = GetStorage();
  final String _key = 'name';

  String? loadFromBox() => _box.read(_key);

  void saveToBox(String name) => _box.write(_key, name);
}
