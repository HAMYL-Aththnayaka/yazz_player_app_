import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
 const MyDrawer({super.key});



  @override 
  Widget build(BuildContext context){
    return Drawer(
      child:Column(
        children:[
          //logo
            DrawerHeader(
              child:Center(
                child:Icon(
                  Icons.music_note,
                  size:30,
                  color:Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            ListTile(
              leading:Container(
                child: Icon(
                  Icons.home,
                  color:Theme.of(context).colorScheme.primary,
                ),
              ),
              title:Text('Home'),
              onTap:(){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:Container(
                child: Icon(
                  Icons.settings_applications_sharp,
                  color:Theme.of(context).colorScheme.primary,
                ),
              ),
              title:Text('Settings'),
              onTap:(){
                Navigator.pop(context);
                Navigator.pushNamed(context,'/setting');
              },
            ),


          //home tile

          //setting tile
        ]
      ),
    );
  }
}