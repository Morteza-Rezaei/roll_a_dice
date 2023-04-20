import 'package:flutter/material.dart';
import 'package:roll_a_dice/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final Color color1;
  final Color color2;

  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.blue({super.key})
      : color1 = Colors.blue,
        color2 = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: startAlignment,
            end: endAlignment,
          ),
        ),
        child: const Center(
          child: DiceRoller(),
        ));
  }
}
