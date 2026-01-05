import 'package:flutter/material.dart';
/*
  - ThemeMode.light
  - ThemeMode.dark
  - ThemeMode.system
  -> Bu değerler MaterialApp üzerinden kontrol edilir.

  - Tema değişimi state ister.
  - En basit yol: ValueNotifier 👍
  ⭐ Basit & Temiz Çözüm (ValueNotifier) 

  - System Theme (Telefon Ayarları)
  ** ThemeController.themeMode.value = ThemeMode.system;
*/

// Tema değişimi için ChangeNotifier kullanmalısın..

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == ThemeMode.dark;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    notifyListeners(); // 🔴 BU OLMAZSA TEMA DEĞİŞMEZ!!
  }

  void setDark() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setLight() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }
}

