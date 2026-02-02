import 'package:flutter/material.dart';
import 'package:yazz_player_app/compoonents/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title:  Text(' PLAY LIST '),
      ),
      drawer:MyDrawer(),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}