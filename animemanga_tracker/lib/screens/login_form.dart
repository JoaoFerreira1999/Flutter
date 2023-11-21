import 'dart:convert';
import 'dart:io';
import 'package:animemanga_tracker/providers/users_provider.dart';
import 'package:animemanga_tracker/screens/homescreen.dart';
import 'package:animemanga_tracker/models/user.dart';
import 'package:animemanga_tracker/widgets/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key, required this.switchScreen});

  final void Function() switchScreen;

  @override
  ConsumerState<LoginForm> createState() {
    return _LoginForm();
  }
}

class _LoginForm extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  var loginState = false;

  void saveDetails(String username, String email) {
    ref.read(userProvider.notifier).addUser(username, email);
  }

  Future<void> login(email, password) async {
    String url = "http://10.0.2.2:5011/User/login";

    Map userData = {'Email': email, 'Password': password};

    var body = json.encode(userData);

    final getToken = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: body,
    );

    var token = json.decode(getToken.body);
    await storage.write(key: 'jwt', value: token);

    if (token != null) {
      final getUserDetails = await http.get(
        Uri.parse("http://10.0.2.2:5011/User/Me"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );

      if (getUserDetails.body != "") {
        var userDetails = json.decode(getUserDetails.body);
        saveDetails(userDetails["username"], userDetails["email"]);
        setState(() {
          loginState = true;
        });
      } else {
        return;
      }
    } else {
      setState(() {
        loginState = false;
      });
    }
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
              await login(_emailController.text, _passwordController.text),
              if (loginState == true)
                {
                  if (mounted)
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              "You are now logged in!",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const IntroScreen(),
                                  ),
                                ),
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      ),
                    },
                }
              else
                {
                  if (mounted)
                    {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Failed to Login!"),
                            content: const Text(
                              "User/Password is incorrect! Please try again.",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, "Ok"),
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      ),
                    }
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
