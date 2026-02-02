import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title:  Text(' PLAY LIST '),
      ),
      drawer:Drawer(),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}