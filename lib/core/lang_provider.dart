import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Locale('en');

  // LanguageProvider() {
  //   _loadLocale();
  // }

  // void _loadLocale() async {
  //   // final prefs = await SharedPreferences.getInstance();
  //   String? langCode = prefs.getString('language');
  //   if (langCode != null) {
  //     _locale = Locale(langCode);
  //   }
  //   notifyListeners();
  // }

  // void setLocale(Locale newLocale) async {
  //   _locale = newLocale;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('language', newLocale.languageCode);
  //   notifyListeners();
  // }

  Locale get locale => _locale;
}
