import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/screens/HOME/album.dart';
import 'data.dart' as data;

class Home extends StatelessWidget {
  const Home({super.key});
  // this.changescr1, this.changescr2, this.changescr3,
  // final void Function() changescr1;
  // final void Function() changescr2;
  // final void Function() changescr3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/logos/icons8-spotify-32.png",
                    width: 35, height: 35),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Spotify',
                  style: GoogleFonts.baloo2(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Logo(
                  logo: Icons.watch_later_outlined,
                ),
                Logo(
                  logo: Icons.notifications,
                ),
                Logo(
                  logo: Icons.settings,
                ),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black87.withOpacity(0.6),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black87.withOpacity(0.6),
            Colors.black87.withOpacity(0.7),
            Colors.black87.withOpacity(0.8),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: ListView(
            shrinkWrap: false,
            children: [
              const Heading(
                heading: 'Recently Played',
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ...data.albums.entries.map((entry) {
                      final key = entry.key;
                      final value = entry.value;
                      return Cover(
                        album_cover: value["img"],
                        name: value["name"],
                        change: key,
                        map: data.albums,
                      );
                    }).toList(),
                  ]),
                ),
              ),
              const Heading(
                heading: 'Made for you',
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    ...data.artists.entries.map((entry) {
                      final key = entry.key;
                      final value = entry.value;
                      return Cover(
                        album_cover: value["img"],
                        name: value["name"],
                        change: key,
                        map: data.artists,
                      );
                    }).toList(),
                  ]),
                ),
              ),
              const Heading(
                heading: 'Trending Songs',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.logo});
  final IconData logo;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        logo,
        color: const Color(0xffd5d5d5), //Color.fromRGBO(30, 215, 96, 1
        size: 28,
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        heading,
        style: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class Cover extends StatelessWidget {
  const Cover(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.album_cover,
      required this.name,
      required this.change,
      required this.map});
  // ignore: non_constant_identifier_names
  final String album_cover;
  final String name;
  final String change;
  final Map map;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.of(
            context,
          ).push(
            MaterialPageRoute(
              builder: (context) => AlbumPage(
                index: change,
                map: map,
              ),
            ),
          );
        },
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                album_cover,
                width: 140,
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xfff5f5f5),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
      ),
    );
  }
}
