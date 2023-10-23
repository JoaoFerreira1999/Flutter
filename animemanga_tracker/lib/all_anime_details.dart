import 'package:animemanga_tracker/widgets/video_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AllAnimeDetails extends StatefulWidget {
  const AllAnimeDetails(
      {super.key,
      required this.specificDetails,
      required this.hideNavigationBar});

  final void Function() hideNavigationBar;

  final specificDetails;

  @override
  State<StatefulWidget> createState() {
    return _AllAnimesDetails();
  }
}

class _AllAnimesDetails extends State<AllAnimeDetails> {
  var genres;
  late String firstHalf;
  late String secondHalf;
  late String rating;

  bool showText = true;

  @override
  void initState() {
    super.initState();
    genres = widget.specificDetails["genres"];

    if (widget.specificDetails["synopsis"].length > 150) {
      firstHalf = widget.specificDetails["synopsis"].substring(0, 150);
      secondHalf = widget.specificDetails["synopsis"]
          .substring(151, widget.specificDetails["synopsis"].length);
    } else {
      firstHalf = widget.specificDetails["synopsis"];
      secondHalf = "";
    }

    rating = widget.specificDetails["rating"];
    if (rating == "PG-13 - Teens 13 or older") {
      rating =
          rating.substring(0, widget.specificDetails["rating"].indexOf(' '));
    } else {
      rating =
          rating.substring(0, widget.specificDetails["rating"].indexOf('('));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          onPressed: () => {widget.hideNavigationBar(), Navigator.pop(context)},
        ),
        title: const Text(
          'Anime Corner',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 22, 22),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.085, 0.085],
                colors: [
                  Color.fromARGB(255, 24, 22, 22),
                  Color.fromARGB(255, 51, 51, 51)
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.specificDetails["images"]["jpg"]
                              ["large_image_url"],
                          height: 300,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 300,
                        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Score",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.white,
                                  size: 26,
                                ),
                                Text(
                                  widget.specificDetails["score"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Rank",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  '#${widget.specificDetails["rank"]}',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Popularity",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  '#${widget.specificDetails["popularity"]}',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Members",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.specificDetails["members"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Favorites",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.specificDetails["favorites"]
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: widget.specificDetails["title"].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.from(
                    genres.map(
                      (item) => Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          item["name"],
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: secondHalf.length == ""
                            ? Text(
                                widget.specificDetails["synopsis"],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    showText
                                        ? firstHalf
                                        : widget.specificDetails["synopsis"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        showText = !showText;
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          showText
                                              ? Icons.arrow_drop_down_rounded
                                              : Icons.arrow_drop_up_rounded,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                VideoPlayer(url: widget.specificDetails["url"]),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "English",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Text(
                            widget.specificDetails["title_english"] ??
                                widget.specificDetails["title"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Source",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        widget.specificDetails["source"],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Studio",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        widget.specificDetails["studios"][0]
                                            ["name"],
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Rating",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                      Text(
                                        rating,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 80, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          "Season",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                        Text(
                                          widget.specificDetails["season"]
                                                  .replaceFirst(
                                                      widget.specificDetails[
                                                          "season"][0],
                                                      widget.specificDetails[
                                                              "season"][0]
                                                          .toUpperCase()) +
                                              " " +
                                              widget.specificDetails["year"]
                                                  .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Aired",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                        Text(
                                          widget.specificDetails["aired"]
                                              ["string"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Producer",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                        Text(
                                          widget.specificDetails["producers"][0]
                                              ["name"],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
