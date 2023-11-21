import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/anime.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.animeDetails});

  final Anime animeDetails;

  @override
  State<StatefulWidget> createState() {
    return _ResultsScreen();
  }
}

class _ResultsScreen extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 60),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Center(
        child: Card(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.animeDetails.largeImage,
                height: 510,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Row(
                  children: [
                    Text(widget.animeDetails.fromTo),
                    const Spacer(),
                    Text(widget.animeDetails.rating),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  children: [
                    Text(widget.animeDetails.status),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
