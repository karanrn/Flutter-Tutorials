import 'package:flutter/material.dart';
import 'package:sample_app/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier {
  ThemeData _themeData;
  final String _kthemePreference = "theme_preference";
  
  ThemeManager(){
    _loadTheme();
  }
  // Load saved theme
  void _loadTheme(){
    debugPrint("Entered loadTheme");
    SharedPreferences.getInstance().then((prefs){
      int preferedTheme = prefs.getInt(_kthemePreference) ?? 0;
      _themeData = appThemeData[AppTheme.values[preferedTheme]];

      // Notify listeners
      notifyListeners();
    });
  }
  // Use this method on UI to get selected theme.
  ThemeData get themeData {
    if (_themeData == null) {
      _themeData = appThemeData[AppTheme.White];
    }
    return _themeData;
  }

  // Sets theme and notifies listeners about change. 
  setTheme(AppTheme theme) async {
    _themeData = appThemeData[theme];

    // Save the selected theme into Sharedpreferences
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_kthemePreference, AppTheme.values.indexOf(theme));
    // Here we notify listeners that theme changed 
    // so UI have to be rebuild
    notifyListeners();
  }
}