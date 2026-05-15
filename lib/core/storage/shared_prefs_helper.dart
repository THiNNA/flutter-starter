import 'package:shared_preferences/shared_preferences.dart';
import '../constants/storage_keys.dart';

/// Wrapper class for SharedPreferences to handle non-sensitive settings.
class SharedPrefsHelper {
  final SharedPreferences _prefs;

  SharedPrefsHelper(this._prefs);

  Future<void> saveThemeMode(bool isDark) async {
    await _prefs.setBool(StorageKeys.themeMode, isDark);
  }

  bool isDarkMode() {
    return _prefs.getBool(StorageKeys.themeMode) ?? false;
  }
}
