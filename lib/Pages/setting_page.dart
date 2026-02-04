import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yazz_player_app/Theme/theme_provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G S'),
      ),
      body:  Container(
        decoration:BoxDecoration(
        color:Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        padding:EdgeInsets.all(16.0),
        margin:EdgeInsets.all(16.0),
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children:[
              Text(
                'Dark Mode',
                style:TextStyle(
                  fontSize:18.0,
                  fontWeight:FontWeight.bold,
                ),
              ),
              Spacer(), 
            //darken and light mode switch
            CupertinoSwitch(
              value:Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged:(value)=>
                Provider.of<ThemeProvider>(context,listen:false).toggleTheme(),
              
            ),

          ],

        
        ),
      ),
    );
  }
}