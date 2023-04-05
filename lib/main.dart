
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dice Game App'),
        backgroundColor: Colors.teal,
      ),
      body: const DicePage(),
    ),
  )
  );
}


class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber =  Random().nextInt(6) + 1;
  int rightDiceNumber = Random().nextInt(6) + 1;

  void showBravoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('BRAVO YOU GOT A MATCH!'),
          content: Image.asset('images/bravo.png'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Center (
      child: Row(
        children:  <Widget> [
          Expanded(
            child: TextButton(onPressed: () {
              setState(() {
                //randomDice();

                leftDiceNumber = Random().nextInt(6) + 1;
                rightDiceNumber = Random().nextInt(6) + 1;
                if (leftDiceNumber == rightDiceNumber) {
                  showBravoDialog();
                }
                print('Left button got pressed');
              });

            },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(onPressed: () {
              setState(() {
                //randomDice();
                rightDiceNumber = Random().nextInt(6) + 1;
                leftDiceNumber = Random().nextInt(6) + 1;
                if (leftDiceNumber == rightDiceNumber) {
                  showBravoDialog();
                }

              });

            },
              child: Image.asset('images/dice$rightDiceNumber.png'),),
          )


        ],


      ),

    );
  }
}


/*
void randomDice() {
  int leftDiceNumber = 6;
  int rightDiceNumber = 5;
  leftDiceNumber = Random().nextInt(6) + 1;
  rightDiceNumber = Random().nextInt(6) + 1;
  print('Left Dice Number = $leftDiceNumber');
  print('Right Dice Number = $rightDiceNumber');
}*/
