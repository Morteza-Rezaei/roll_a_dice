// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_a_dice/roll_text_btn.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  final _diceList = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];

  int diceRoll1 = 0, diceRoll2 = 0, diceSum = 0, point = 0;

  void rollDice() {
    setState(() {
      diceRoll1 = randomizer.nextInt(6);
      diceRoll2 = randomizer.nextInt(6);
      diceSum = diceRoll1 + diceRoll2 + 2;

      if (diceSum == point) {
        winThrow();
      } else {
        loseThrow();
      }
    });
  }

  Future<dynamic> loseThrow() async {
    await Future.delayed(const Duration(seconds: 1));
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Try Again!'),
            content: Text(
              'You guessed the sum incorrectly!\nYour Guess : $point\nSum of Dices : $diceSum',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  reset();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('Play Again'),
              ),
            ],
          );
        });
  }

  Future<dynamic> winThrow() async {
    await Future.delayed(const Duration(seconds: 1));
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('You Win!'),
            content: Text(
              'You guessed the sum correctly!\nYour Guess : $point\nSum of Dices : $diceSum',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  reset();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text('Play Again'),
              ),
            ],
          );
        });
  }

  void reset() {
    setState(() {
      diceRoll1 = 0;
      diceRoll2 = 0;
      diceSum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: 'Guess the sum of the dices',
            ),
            onChanged: (value) {
              point = int.parse(value);
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              _diceList[diceRoll1],
              width: 100,
            ),
            Image.asset(
              _diceList[diceRoll2],
              width: 100,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('Dice Sum: $diceSum',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          child: const RollTextBtn('Roll Dice'),
        ),
      ],
    );
  }
}
