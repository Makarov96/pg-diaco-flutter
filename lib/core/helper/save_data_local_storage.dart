import 'package:localstorage/localstorage.dart';

class SaveDataLocalStorage {
  static final storage = LocalStorage('generalKey');

  static Future<void> saveValue(String key, dynamic value) async {
    final checkReady = await storage.ready;

    if (checkReady) {
      await storage.setItem(key, value);
    } else {
      await storage.setItem(key, value);
    }
  }

  static Future<dynamic> getValue(String key) async {
    final checkReady = await storage.ready;

    if (checkReady) {
      final dynamic value = storage.getItem(key);
      return value;
    } else {
      await Future<dynamic>.delayed(const Duration(milliseconds: 300));
      return storage.getItem(key);
    }
  }

  static Future<void> deleteValue(String key) async {
    await storage.deleteItem(key);
  }

  static Future<void> clear() async {
    await storage.clear();
  }
}
