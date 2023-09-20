import 'package:flutter/material.dart';
import 'dart:math';

var activeDiceImage = "assets/images/dice-2.png";
final randomizer = Random();


class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
  var currentDiceRoll = 2;

  void rollDice(){
    setState(() {
      currentDiceRoll = Random().nextInt(6) + 1;
      activeDiceImage = "assets/images/dice-$currentDiceRoll.png";
    });

    //print('Changing image...');
  }

  @override
  Widget build(context){
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset(
              activeDiceImage,
              width: 200,  
            ),
            TextButton(
              onPressed: rollDice, 
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white, 
                textStyle: const TextStyle(
                  fontSize: 28,
                )),
              child: const Text("Roll the dice!"),
            )
          ],
        );
  }
}