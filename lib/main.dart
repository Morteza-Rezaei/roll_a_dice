import 'package:flutter/material.dart';
import 'package:roll_a_dice/background_gradiant_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      title: 'Dice Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dice Game'),
          centerTitle: true,
        ),
        body: const GradientContainer.blue(),
      ),
    );
  }
}
