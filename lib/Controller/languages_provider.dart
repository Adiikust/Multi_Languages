import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/app_constant.dart';

class LanguagesProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void changeLanguages(Locale languageType) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _locale = languageType;
    if (languageType == const Locale('en')) {
      await pref.setString(AppConstant.getLanguageTypeCode, 'en');
    } else {
      await pref.setString(AppConstant.getLanguageTypeCode, 'es');
    }
    notifyListeners();
  }
}
