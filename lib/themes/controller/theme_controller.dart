import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/shared_preferences.dart';

final themeProvider = ChangeNotifierProvider<ThemeController>((ref) {
  return ThemeController();
});

class ThemeController extends ChangeNotifier {
  bool _isDark = false;

  ThemeController() {
    // TODO: implement ThemeController
    savedTheme();
  }

  void changeTheme() {
    _isDark = !_isDark;
    setTheme(_isDark);
    notifyListeners();
  }

  savedTheme() async {
    var check = LocalStorage.getBool('isDark');
    if (check != null && check != false) {
      changeTheme();
    }
    debugPrint('Theme Saved locally');
  }

  setTheme(bool val) async {
    await LocalStorage.setBool('isDark', val);
  }

  //getters
  bool get isDark => _isDark;
}
