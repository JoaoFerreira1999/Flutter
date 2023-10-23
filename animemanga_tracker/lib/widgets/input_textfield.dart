import 'package:animemanga_tracker/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InputTextField extends StatefulWidget {
  const InputTextField({super.key, required this.switchScreen});

  final void Function(Anime details) switchScreen;

  @override
  State<StatefulWidget> createState() {
    return _InputTextField();
  }
}

class _InputTextField extends State<InputTextField> {
  final _inputController = TextEditingController();

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> getAnimeDetails() async {
    final animeName = _inputController.text;

    String url = "http://10.0.2.2:5011/api/Anime/$animeName";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    final anime = Anime(
      responseData["data"][0]['mal_id'],
      responseData["data"][0]['title'],
      responseData["data"][0]['synopsis'],
      responseData["data"][0]['status'],
      responseData["data"][0]['rating'],
      responseData["data"][0]['episodes'],
      responseData["data"][0]['score'],
      responseData["data"][0]['rank'],
      responseData["data"][0]['popularity'],
      responseData["data"][0]['members'],
      DateTime.parse(responseData["data"][0]['aired']['from']),
      DateTime.parse(responseData["data"][0]['aired']['to']),
      responseData["data"][0]['aired']['string'],
      responseData["data"][0]['type'],
      responseData["data"][0]['images']['jpg']['image_url'],
      responseData["data"][0]['images']['jpg']['small_image_url'],
      responseData["data"][0]['images']['jpg']['large_image_url'],
    );

    widget.switchScreen(anime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 73, 73, 73),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Anime & Manga Info',
              style:
                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 44),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _inputController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        label: Text(
                          'What anime are you looking for?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_inputController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Empty Search'),
                            content: const Text('Please enter a valid name'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                },
                                child: const Text('Okay'),
                              )
                            ],
                          ),
                        );
                        return;
                      } else {
                        await getAnimeDetails();
                      }
                    },
                    child: const Text('Search')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
