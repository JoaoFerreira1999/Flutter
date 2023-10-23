import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "OtakuCorner",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome back, you've been missed!",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400],
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: InkWell(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account yet?",
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                widget.switchScreen();
              },
              child: const Text(
                " Register now!",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ],
    );
  }
}
