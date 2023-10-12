// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'data.dart' as data;

class play extends StatefulWidget {
  const play({Key? key, required this.index, required this.map})
      : super(key: key);
  final int index;
  final Map map;
  @override
  State<play> createState() {
    // ignore: no_logic_in_create_state
    return _play(index: index, map: map);
  }
}

class _play extends State<play> {
  _play({required this.index, required this.map});
  final int index;
  final Map map;
  @override
  Widget build(context) {
    void back() {
      Navigator.pop(context);
    }

    AudioPlayer audioPlayer = AudioPlayer();
    int state = 0;
    void playSong() async {
      setState(() {
        state = 1;
      });
    }

    void pauseSong() async {
      setState(() {
        state = 0;
      });
    }

    return Scaffold(
        body: Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            map["songs"][index]["img"] ?? map["img"],
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          color: Colors.black.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Logo(icon: Icons.keyboard_arrow_down_sharp, func: back),
                    Column(
                      children: [
                        Text(
                          "playing from Album",
                          style: GoogleFonts.ibmPlexMono(
                              textStyle: const TextStyle(
                                  fontSize: 13, color: Color(0xaff5f5f5))),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          map["name"],
                          style: GoogleFonts.ibmPlexMono(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                color: Color(0xfff5f5f5),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(children: [
                      Logo(
                        icon: Icons.more_vert_rounded,
                        func: () {},
                      ),
                    ])
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  map["songs"][index]["img"] ?? map["img"],
                  width: 350,
                  height: 350,
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            map["songs"][index]["name"],
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 25,
                                  color: Color(0xfff5f5f5),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          size: 30,
                          color: Color(0xfff5f5f5),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Divider(
                    color: const Color(0xff333333).withOpacity(0.8),
                    thickness: 2,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shuffle,
                        color: Color(0xfff5f5f5),
                        size: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.keyboard_double_arrow_left_rounded,
                            size: 40,
                            color: Color(0xfff5f5f5),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // if (state == 0) {
                              //   playSong();
                              // } else {
                              //   pauseSong();
                              // }
                              audioPlayer.setSource(
                                  AssetSource('assets/audio/udd_gaye.wav'));
                              audioPlayer.play(
                                  AssetSource('assets/audio/udd_gaye.wav'));
                              print("playing");
                            },
                            child: Icon(
                              Icons.play_circle_filled_rounded,
                              size: 75,
                              color: Color(0xfff5f5f5),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            size: 40,
                            color: Color(0xfff5f5f5),
                          )
                        ],
                      ),
                      Icon(
                        Icons.loop_rounded,
                        size: 25,
                        color: Color(0xfff5f5f5),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'LYRICS',
                            style: GoogleFonts.ibmPlexSans(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70)),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey),
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(15.0),
                            child: const Column(children: [
                              Text("Enjoy Lyrics on Spotify Premium")
                            ]),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.icon, required this.func});
  final IconData icon;
  final Function() func;
  @override
  Widget build(context) {
    return IconButton(
      onPressed: func,
      icon: Icon(
        icon,
        color: const Color(0xfff5f5f5),
        size: 30,
      ),
    );
  }
}
