import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HOME/home.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  Widget build(context) {
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
                  'Search',
                  style: GoogleFonts.ibmPlexMono(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Logo(logo: Icons.camera_alt),
              ],
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 215, 96, 1),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xff333333),
      ),
    );
  }
}
