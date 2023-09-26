// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.black87.withOpacity(0.8),
        Colors.black87.withOpacity(0.7),
        Colors.black87.withOpacity(0.6),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
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
              height: 50,
            ),
            Image.asset(
              map["songs"][index]["img"] ?? map["img"],
              width: 350,
              height: 350,
            ),
            const SizedBox(
              height: 30,
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Divider(
                color: const Color(0xff333333).withOpacity(0.8),
                thickness: 2,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
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
                      Icon(
                        Icons.play_circle_filled_rounded,
                        size: 75,
                        color: Color(0xfff5f5f5),
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
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key, required this.icon, required this.func});
  final IconData icon;
  final Function() func;
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
