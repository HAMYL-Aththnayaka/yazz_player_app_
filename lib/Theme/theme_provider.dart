import 'package:flutter/material.dart';
import 'package:yazz_player_app/Theme/dark_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initially set to light mode
  ThemeData _themeData =ThemeData.light();

  ThemeProvider(lightModeTheme);

  //get ThemeData
  ThemeData get themeData {
    return _themeData;
  }

  //darkmode Checker
  bool get isDarkMode{
    return _themeData == darkmode;
  }


  //set Theme
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }
  
  //tooggle Theme
  void toggleTheme(){
    if(isDarkMode){
      _themeData = ThemeData.light();
    }else{
      _themeData = darkmode;
    }
    notifyListeners();
  }

}