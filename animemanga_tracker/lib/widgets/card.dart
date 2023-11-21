import 'package:animemanga_tracker/screens/all_anime_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeCard extends StatefulWidget {
  const AnimeCard(
      {super.key, required this.animeDetails, required this.hideNavigationBar});

  final void Function() hideNavigationBar;

  final animeDetails;

  @override
  State<StatefulWidget> createState() {
    return _AnimeCard();
  }
}

class _AnimeCard extends State<AnimeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      child: GestureDetector(
        onTap: () => {
          widget.hideNavigationBar(),
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AllAnimeDetails(
                specificDetails: widget.animeDetails,
                hideNavigationBar: widget.hideNavigationBar,
              ),
            ),
          )
        },
        child: Card(
          color: const Color.fromARGB(255, 24, 22, 22),
          elevation: 0,
          child: SizedBox(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.animeDetails["images"]["jpg"]["image_url"],
                  height: 200,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: widget.animeDetails["title"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
