import 'package:flutter/material.dart';
import 'package:yazz_player_app/compoonents/new_box.dart';


class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Page'),
      ),
      body: Center(
        child: NewBox(
          child: Icon(
            Icons.search,
            size: 50,
            color:Colors.black
            ),
          
        ),
    ),
    );
  }
}