import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart' as data;

List albums = data.albums;

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<AlbumPage> createState() {
    // ignore: no_logic_in_create_state
    return _AlbumPage(index);
  }
}

class _AlbumPage extends State<AlbumPage> {
  _AlbumPage(this.index);
  final int index;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: CustomAppBar(
        albums[index]["name"],
        color: albums[index]["color"],
      ),
      body: Page(artist: albums[index]),
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
              color,
              color.withOpacity(0.6),
            ],
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
    );
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required this.artist});
  final Map artist;
  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xff333257),
          Color(0xff334257),
          Color(0xff3C4048),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        children: [
          Image.asset(
            artist["img"],
            width: 230,
            height: 230,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'By ${artist["artist"]}',
            style: GoogleFonts.adventPro(
              textStyle: const TextStyle(
                color: Color(0xff1DB954),
                fontSize: 23,
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
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
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
            );
          }).toList()
        ],
      ),
    );
  }
}

class Song extends StatelessWidget {
  Song({super.key, required this.name, required this.duration});
  final String name;
  final String duration;
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        print("Playing $name");
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
                          color: Color(0xffd5d5d5),
                          fontSize: 18,
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
