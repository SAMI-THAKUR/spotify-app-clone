import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/screens/HOME/play.dart';
import 'data.dart' as data;

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.index, required this.map})
      : super(key: key);
  final String index;
  final Map map;
  @override
  State<AlbumPage> createState() {
    // ignore: no_logic_in_create_state
    return _AlbumPage(index, map);
  }
}

class _AlbumPage extends State<AlbumPage> {
  _AlbumPage(this.index, this.map);
  final String index;
  final Map map;
  bool liked = false;
  void like() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(context) {
    Map albums = map;
    return Scaffold(
      appBar: CustomAppBar(
        albums[index]["name"],
        color: albums[index]["color"],
      ),
      body: Page(artist: albums[index], state: liked, like: like),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String name;
  final Color color;
  CustomAppBar(this.name, {super.key, required this.color})
      : preferredSize = const Size.fromHeight(45.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.8),
              color.withOpacity(0.8),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: const Color(0xff333333),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: GoogleFonts.ibmPlexMono(
                  textStyle: const TextStyle(
                    color: Color(0xff0d1117),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.artist,
    required this.state,
    required this.like,
  });
  final Map artist;
  final bool state;
  final void Function() like;
  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          artist["color"].withOpacity(0.8),
          artist["color"].withOpacity(0.7),
          Colors.black87.withOpacity(0.6),
          Colors.black87.withOpacity(0.7),
          Colors.black87.withOpacity(0.8),
          Colors.black87.withOpacity(0.8),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            artist["img"],
            width: 230,
            height: 230,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            artist["name"] ?? artist["artist"],
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: like,
                      icon: Icon(
                        state ? Icons.favorite : Icons.favorite_border,
                        color: state
                            ? const Color.fromARGB(255, 12, 228, 19)
                            : Colors.white,
                        size: 30,
                      ),
                      color: const Color(0xffd5d5d5),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        size: 30,
                      ),
                      color: const Color(0xffd5d5d5),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.repeat,
                        size: 30,
                      ),
                      color: const Color(0xffd5d5d5),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle_fill,
                        size: 40,
                      ),
                      color: const Color(0xff1db954),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ...artist["songs"].map((song) {
            return Song(
              name: song["name"],
              duration: song["duration"],
              index: artist["songs"].indexOf(song),
              map: artist,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class Song extends StatelessWidget {
  Song({
    super.key,
    required this.name,
    required this.duration,
    required this.index,
    required this.map,
  });
  final String name;
  final String duration;
  final int index;
  final Map map;
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        print(map);
        print(index);
        print("Playing $name");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => play(index: index, map: map)));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 20),
        child: Row(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: const TextStyle(
                          color: Color(0xfff5f5f5),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      duration,
                      style: GoogleFonts.ibmPlexSans(
                        textStyle: const TextStyle(
                          color: Color(0xffd5d5d5),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              color: const Color(0xffd5d5d5),
            ),
          ],
        ),
      ),
    );
  }
}
