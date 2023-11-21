import 'package:animemanga_tracker/screens/initial_screen.dart';
import 'package:animemanga_tracker/screens/profile.dart';
import 'package:animemanga_tracker/widgets/more_card.dart';
import 'package:animemanga_tracker/widgets/recommended_ACard.dart';
import 'package:flutter/material.dart';
import 'package:animemanga_tracker/widgets/textfield.dart';
import 'package:animemanga_tracker/models/anime.dart';
import 'package:animemanga_tracker/widgets/card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../providers/users_provider.dart';

class AllAnimes extends ConsumerStatefulWidget {
  const AllAnimes({super.key, required this.hideNavigationBar});

  final void Function() hideNavigationBar;

  @override
  ConsumerState<AllAnimes> createState() {
    return _AllAnimes();
  }
}

class _AllAnimes extends ConsumerState<AllAnimes> {
  final _inputController = TextEditingController();

  var topAnimeDetails = [];
  var airingAnimeDetails = [];
  var recommendedAnime = [];

  @override
  void initState() {
    super.initState();
    getTopAnime();
    getAiringAnime();
    getRecommendations();
    ref.read(userProvider);
  }

  Future<void> getTopAnime() async {
    String url = "http://10.0.2.2:5011/topAnimes";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    setState(() {
      topAnimeDetails = responseData;
    });
  }

  Future<void> getAiringAnime() async {
    String url = "http://10.0.2.2:5011/airing";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    setState(() {
      airingAnimeDetails = responseData;
    });
  }

  Future<void> getRecommendations() async {
    String url = "http://10.0.2.2:5011/recommendations";

    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);
    var finalResponse = [];

    for (var i = 0; i < 10; i++) {
      finalResponse.add(responseData[i]);
    }

    setState(() {
      recommendedAnime = finalResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDetails = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anime Corner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        actions: [
          IconButton(
            onPressed: () {
              if (userDetails.email != "") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Profile(),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text(
                        "You are not logged in yet!",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const InitialScreen(),
                            ),
                          ),
                          child: const Text("Login"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: const Icon(Icons.person_rounded),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TextBox(),
                ),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                "Top Anime",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...topAnimeDetails.map(
                      (element) {
                        return AnimeCard(
                          animeDetails: element,
                          hideNavigationBar: widget.hideNavigationBar,
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.arrow_forward_rounded,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                "Airing Anime",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...airingAnimeDetails.map(
                      (element) {
                        return AnimeCard(
                          animeDetails: element,
                          hideNavigationBar: widget.hideNavigationBar,
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.arrow_forward_rounded,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Text(
                "Recommendations",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...recommendedAnime.map(
                      (element) {
                        return RecommendedAnimeCard(animeDetails: element);
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () => {},
                        icon: const Icon(Icons.arrow_forward_rounded,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> getAnimeDetails(String animeName) async {
  String url = "http://10.0.2.2:5011/api/Anime/$animeName";

  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(response.body);

  final anime = Anime(
    responseData[0]['mal_id'],
    responseData[0]['title'],
    responseData[0]['synopsis'],
    responseData[0]['status'],
    responseData[0]['rating'],
    responseData[0]['episodes'],
    responseData[0]['score'],
    responseData[0]['rank'],
    responseData[0]['popularity'],
    responseData[0]['members'],
    DateTime.parse(responseData[0]['aired']['from']),
    DateTime.parse(responseData[0]['aired']['to']),
    responseData[0]['aired']['string'],
    responseData[0]['type'],
    responseData[0]['images']['jpg']['image_url'],
    responseData[0]['images']['jpg']['small_image_url'],
    responseData[0]['images']['jpg']['large_image_url'],
  );
}
