import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yazz_player_app/Pages/home_page.dart';
import 'package:yazz_player_app/Pages/setting_page.dart';
import 'package:yazz_player_app/Theme/light_mode.dart';
import 'package:yazz_player_app/Theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
     create: (context) => ThemeProvider(),
      child:const MyApp())
  
  ) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
      theme:Provider.of<ThemeProvider>(context).themeData,
      routes:{
          '/setting':(context) =>const SettingPage(),
      }
        );
  }
}
