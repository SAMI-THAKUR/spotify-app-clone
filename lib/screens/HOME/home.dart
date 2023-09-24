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
                    width: 30, height: 30),
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
        backgroundColor: const Color(0xff1DB954),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black87.withOpacity(0.8),
            Colors.black87.withOpacity(0.8),
            Colors.black87.withOpacity(0.7),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Popular Albums',
                  style: GoogleFonts.play(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Album_Cover(
                      album_cover: data.albums[0]["img"],
                      name: data.albums[0]["name"],
                      change: 0,
                    ),
                    Album_Cover(
                      album_cover: data.albums[1]["img"],
                      name: data.albums[1]["name"],
                      change: 1,
                    ),
                    Album_Cover(
                      album_cover: data.albums[2]["img"],
                      name: data.albums[2]["name"],
                      change: 2,
                    ),
                    Album_Cover(
                      album_cover: data.albums[3]["img"],
                      name: data.albums[3]["name"],
                      change: 3,
                    ),
                  ]),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Artists',
                  style: GoogleFonts.play(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Artist_Cover(
                      album_cover: data.arjit["img"],
                      name: data.arjit["name"],
                      change: 0,
                    ),
                    Artist_Cover(
                      album_cover: data.ed_sheeran["img"],
                      name: data.ed_sheeran["name"],
                      change: 1,
                    ),
                    Artist_Cover(
                      album_cover: data.harry_styles["img"],
                      name: data.harry_styles["name"],
                      change: 2,
                    ),
                    Artist_Cover(
                      album_cover: data.ap_dhillon["img"],
                      name: data.ap_dhillon["name"],
                      change: 4,
                    ),
                  ]),
                ),
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
        color: Color(0xf3333333), //Color.fromRGBO(30, 215, 96, 1
        size: 28,
      ),
    );
  }
}

class Album_Cover extends StatelessWidget {
  const Album_Cover(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.album_cover,
      required this.name,
      required this.change});
  // ignore: non_constant_identifier_names
  final String album_cover;
  final String name;
  final int change;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumPage(
                index: change,
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
                width: 150,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xffd5d5d5),
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

class Artist_Cover extends StatelessWidget {
  const Artist_Cover(
      {super.key,
      required this.album_cover,
      required this.name,
      required this.change});
  // required this.change
  // final Function() change;
  final String album_cover;
  final String name;
  final int change;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumPage(
                index: change,
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
                width: 130,
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  name,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Color(0xffd5d5d5),
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
