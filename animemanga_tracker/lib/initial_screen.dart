import 'package:animemanga_tracker/homescreen.dart';
import 'package:animemanga_tracker/login_form.dart';
import 'package:animemanga_tracker/register_form.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InitialScreen();
  }
}

class _InitialScreen extends State<InitialScreen> {
  bool registerState = true;

  void switchScreen() {
    setState(() {
      registerState = !registerState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/dragonball.png'),
              height: 210,
            ),
            registerState
                ? RegisterForm(switchScreen: switchScreen)
                : LoginForm(switchScreen: switchScreen),
            const SizedBox(
              height: 10,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
