import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendedAnimeCard extends StatefulWidget {
  const RecommendedAnimeCard({super.key, required this.animeDetails});

  final animeDetails;

  @override
  State<StatefulWidget> createState() {
    return _RecommendedAnimeCard();
  }
}

class _RecommendedAnimeCard extends State<RecommendedAnimeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 150),
      child: GestureDetector(
        onTap: () => {},
        child: Card(
          color: const Color.fromARGB(255, 32, 31, 31),
          elevation: 0,
          child: SizedBox(
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: widget.animeDetails["entry"][0]["images"]["jpg"]
                      ["image_url"],
                  height: 200,
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: widget.animeDetails["entry"][0]["title"],
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
