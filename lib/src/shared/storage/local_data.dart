import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  Future<void> setStringList(String key, List<String> value) async {
    SharedPreferences storage = await _storage;
    await storage.setStringList(key, value);
  }

  Future<List<String>?> listItems(String key) async {
    SharedPreferences storage = await _storage;
    final List<String>? items = storage.getStringList(key);
    return items;
  }

  Future<void> removeData(String key) async {
    SharedPreferences storage = await _storage;
    await storage.remove(key);
  }
}
