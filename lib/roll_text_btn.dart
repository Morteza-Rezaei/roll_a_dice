import 'package:flutter/material.dart';

class RollTextBtn extends StatelessWidget {
  final String text;

  const RollTextBtn(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
