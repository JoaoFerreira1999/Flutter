import 'dart:convert';
import 'dart:io';
import 'package:animemanga_tracker/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _RegisterForm();
  }
}

class _RegisterForm extends State<RegisterForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String registerStatus = "";

  Future<void> register(String username, String email, String password) async {
    String url = "http://10.0.2.2:5011/User/register";

    Map userData = {'Name': username, 'Email': email, 'Password': password};

    var body = json.encode(userData);

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: body,
    );

    var responseData = json.decode(response.body);

    setState(() {
      registerStatus = responseData;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
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
          child: InkWell(
            onTap: () async => {
              if (_emailController.text.isNotEmpty &&
                  _usernameController.text.isNotEmpty &&
                  _passwordController.text.isNotEmpty)
                {
                  await register(_usernameController.text,
                      _emailController.text, _passwordController.text),
                  if (registerStatus == "User Successfully created!")
                    {
                      if (mounted)
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  registerStatus,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, "Ok"),
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          ),
                        },
                      widget.switchScreen()
                    }
                  else
                    {
                      if (mounted)
                        {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Error Creating User!"),
                                content: Text(
                                  registerStatus,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, "Ok"),
                                    child: const Text("Ok"),
                                  ),
                                ],
                              );
                            },
                          ),
                          _emailController.text = "",
                          _passwordController.text = "",
                          _usernameController.text = "",
                        },
                    }
                }
              else
                {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Empty Fields!"),
                        content: const Text(
                          "Please provide information for the empty fields!",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, "Ok"),
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                    },
                  )
                }
            },
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
