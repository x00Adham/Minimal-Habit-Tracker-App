import 'package:flutter/material.dart';
import 'package:myapp/themes/dark_theme.dart';
import 'package:myapp/themes/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  //lightmode
  ThemeData _themeData = lightMode;

  //get current theme
  ThemeData get themeData => _themeData;
  //is it dark
  bool get isDrarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
