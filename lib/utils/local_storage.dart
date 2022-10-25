import 'package:get_storage/get_storage.dart';

class LocalStorage {
  /// Write in storage
  void saveToStorage({
    String? key,
    dynamic value,
  }) async {
    await GetStorage().write(key!, value);
  }

  /// Read from storage
  Future<dynamic> getFromStorage({
    String? key,
  }) async {
    return await GetStorage().read(key!);
  }

  /// Remove from storage
  void removeFromStorage({
    String? key,
  }) async {
    await GetStorage().remove(key!);
  }

  void erase() async {
    await GetStorage().erase();
  }
}
