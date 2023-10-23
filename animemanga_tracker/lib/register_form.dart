import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
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
          "Create an account and enjoy all the features!",
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
                  hintText: "Username",
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
                  "Register",
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
              "Already created an account?",
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                widget.switchScreen();
              },
              child: const Text(
                " Log in now!",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ],
    );
  }
}
