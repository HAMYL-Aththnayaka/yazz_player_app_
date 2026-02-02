import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        child:Row(
          children:[
            //darken and light mode switch
            CupertinoSwitch(
              value:false,
              onChanged:(value){},
            ),

          ],

        
        ),
      ),
    );
  }
}