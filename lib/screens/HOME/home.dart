import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/screens/HOME/album.dart';
import 'package:spotify/screens/HOME/play.dart';
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
            physics: const BouncingScrollPhysics(),
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
              const SizedBox(
                height: 5,
              ),
              SafeArea(
                child: SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: GridView(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: 10,
                        ),
                        children: [
                          ...data.favourit["songs"].map((entry) {
                            final value = entry;
                            return list(
                              img: value["img"],
                              name: value["name"],
                              duration: value["duration"],
                              index: data.favourit["songs"].indexOf(value),
                              map: data.favourit,
                            );
                          }).toList(),
                        ])),
              ),
              const Heading(heading: "Podcasts"),
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

class list extends StatelessWidget {
  list(
      {super.key,
      required this.img,
      required this.name,
      required this.duration,
      required this.index,
      required this.map});
  final String img;
  final String name;
  final String duration;
  final int index;
  final Map map;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            fullscreenDialog: false,
            builder: (context) => play(index: index, map: map)));
      },
      child: Row(
        children: [
          Image.asset(
            img,
            width: 80,
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  child: Icon(
                    Icons.add,
                    color: Color(0xffd5d5d5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Icon(
                    Icons.more_horiz_rounded,
                    color: Color(0xffd5d5d5),
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
