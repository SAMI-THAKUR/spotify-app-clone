// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// -------------------------------------  Albums  ------------------------------------- //

Map ved = {
  "name": "VED",
  "img": "assets/albums/ved.png",
  "artist": "RITVIZ",
  "color": Colors.lightBlue[200],
  "songs": [
    {
      "name": "UD GAYE",
      "duration": "3:50",
    },
    {
      "name": "VED",
      "duration": "3:50",
    },
    {
      "name": "SAGE",
      "duration": "4:09",
    },
    {
      "name": "VED",
      "duration": "3:00",
    },
    {
      "name": "CHINI",
      "duration": "3:38",
    },
  ],
};

Map starboy = {
  "name": "Starboy",
  "img": "assets/albums/starboy.png",
  "artist": "The Weeknd",
  "color": Colors.deepPurple[600],
  "songs": [
    {
      "name": "Starboy",
      "duration": "3:50",
    },
    {
      "name": "Party Monster",
      "duration": "4:09",
    },
    {
      "name": "False Alarm",
      "duration": "3:40",
    },
    {
      "name": "Reminder",
      "duration": "3:38",
    },
  ]
};

Map imagine = {
  "name": "Evolve",
  "img": "assets/albums/id.png",
  "artist": "Imagine Dragons",
  "color": Colors.indigoAccent,
  "songs": [
    {
      "name": "Believer",
      "duration": "3:23",
    },
    {
      "name": "Thunder",
      "duration": "3:07",
    },
    {
      "name": "Whatever It Takes",
      "duration": "3:21",
    },
    {
      "name": "Walking The Wire",
      "duration": "3:52",
    },
  ]
};

Map divide = {
  "name": "Divide",
  "img": "assets/albums/divide.png",
  "artist": "Ed Sheeran",
  "color": Colors.blue[300],
  "songs": [
    {
      "name": "Dive",
      "duration": "3:58",
    },
    {
      "name": "Shape Of You",
      "duration": "3:53",
    },
    {
      "name": "Perfect",
      "duration": "4:23",
    }
  ]
};

Map four = {
  "name": "FOUR(DELUXE)",
  "img": "assets/albums/1d.png",
  "artist": "One Direction",
  "color": Colors.grey[400],
  "songs": [
    {
      "name": "Night Changes",
      "duration": "3:46",
    },
    {
      "name": "Steal My Girl",
      "duration": "3:48",
    },
    {
      "name": "Ready To Run",
      "duration": "3:16",
    }
  ]
};

Map kohinoor = {
  "name": "Kohinoor",
  "img": "assets/albums/kohinoor.png",
  "artist": "DIVINE",
  "color": Colors.grey,
  "songs": [
    {
      "name": "Kohinoor",
      "img": "assets/albums/kohinoor.png",
      "duration": "3:50",
    },
    {
      "name": "Wallah",
      "img": "assets/albums/kohinoor.png",
      "duration": "3:50",
    },
    {
      "name": "Too Hype",
      "img": "assets/albums/kohinoor.png",
      "duration": "4:09",
    },
    {
      "name": "Remand",
      "img": "assets/albums/kohinoor.png",
      "duration": "3:00",
    },
    {
      "name": "Gandhi Money",
      "img": "assets/albums/kohinoor.png",
      "duration": "3:38",
    },
  ],
};

Map albums = {
  "ved": ved,
  "kohinoor": kohinoor,
  "starboy": starboy,
  "imagine": imagine,
  "divide": divide,
  "four": four,
};

// -------------------------------------  Artists  ------------------------------------- //

Map ritviz = {
  "name": "Ritviz",
  "img": "assets/artists/ritviz-modified.png",
  "color": Colors.deepPurple,
  "songs": [
    {
      "name": "Sage",
      "img": "assets/albums/ved.png",
      "color": Colors.lightBlue[200],
      "duration": "4:09",
    },
    {
      "name": "Ud Gaye",
      "img": "assets/albums/ved.png",
      "color": Colors.lightBlue[200],
      "duration": "3.00",
    },
    {
      "name": "Baarat",
      "img": "assets/albums/baarat.png",
      "color": Colors.lightBlue[200],
      "duration": "3:42",
    },
    {
      "name": "Liggi",
      "img": "assets/albums/dev.png",
      "color": Colors.lightBlue[200],
      "duration": "4:09",
    }
  ]
};

Map arjit = {
  "name": "Arijit Singh",
  "img": "assets/artists/arjit-modified.png",
  "color": Colors.deepPurple,
  "songs": [
    {
      "name": "Tum Hi Ho",
      "img": "assets/songs/tum_hi_ho.png",
      "duration": "4:22",
    },
    {
      "name": "Channa Mereya",
      "img": "assets/songs/cm.png",
      "duration": "4:49",
    },
    {
      "name": "Agar Tum Saath Ho",
      "img": "assets/songs/agar.png",
      "duration": "5:42",
    }
  ]
};

Map harry_styles = {
  "name": "Harry Styles",
  "img": "assets/artists/hs-modified.png",
  "color": Colors.deepPurple[600],
  "songs": [
    {
      "name": "WaterMelon Sugar",
      "img": "assets/songs/watermelon.jpg",
      "duration": "5:41",
    },
    {
      "name": "Two Ghosts",
      "img": "assets/songs/two.webp",
      "duration": "3:49",
    },
    {
      "name": "Kiwi",
      "img": "assets/songs/house.jpg",
      "duration": "2:56",
    }
  ]
};

Map ed_sheeran = {
  "name": "Ed Sheeran",
  "img": "assets/artists/ed-modified.png",
  "color": Colors.deepPurple[600],
  "songs": [
    {
      "name": "Shape Of You",
      "img": "assets/images/album/divide.jpg",
      "duration": "3:53",
    },
    {
      "name": "Perfect",
      "img": "assets/images/album/divide.jpg",
      "duration": "4:23",
    }
  ]
};

Map ap_dhillon = {
  "name": "AP Dhillon",
  "img": "assets/artists/ap-modified.png",
  "color": Colors.deepPurple[600],
  "songs": [
    {
      "name": "Brown Munde",
      "img": "assets/images/album/brown-munde.jpg",
      "duration": "3:46",
    },
    {
      "name": "GOAT",
      "img": "assets/images/album/goat.jpg",
      "duration": "3:48",
    },
    {
      "name": "Facts",
      "img": "assets/images/album/facts.jpg",
      "duration": "3:16",
    },
    {
      "name": "True Stories",
      "img": "assets/images/album/shinda-kahlon.jpg",
      "duration": "3:16",
    }
  ]
};

Map divine = {
  "name": "DIVINE",
  "img": "assets/artists/divine-modified.png",
  "color": Colors.deepPurple[600],
  "songs": [
    {
      "name": "Kohinoor",
      "img": "assets/images/album/kohinoor.jpg",
      "duration": "3:50",
    },
    {
      "name": "Wallah",
      "img": "assets/images/album/kohinoor.jpg",
      "duration": "3:50",
    },
    {
      "name": "Too Hype",
      "img": "assets/images/album/kohinoor.jpg",
      "duration": "4:09",
    },
    {
      "name": "Remand",
      "img": "assets/images/album/kohinoor.jpg",
      "duration": "3:00",
    },
    {
      "name": "Gandhi Money",
      "img": "assets/images/album/kohinoor.jpg",
      "duration": "3:38",
    },
  ],
};

Map artists = {
  "ritviz": ritviz,
  "ap_dhillon": ap_dhillon,
  "harry_styles": harry_styles,
  "arjit": arjit,
  "divine": divine,
  "ed_sheeran": ed_sheeran,
};

// -------------------------------------  Songs  ------------------------------------- //

Map favourit = {
  "name": "Favourit",
  "img": "assets/songs/favourit.png",
  "color": Colors.lightBlue[200],
  "songs": [
    {
      "name": "Ud Gaye 3",
      "img": "assets/albums/ved.png",
      "artist": "Ritviz",
      "color": Colors.lightBlue[200],
      "duration": "3:50",
    },
    {
      "name": "Baarat",
      "img": "assets/albums/ved.png",
      "artist": "Ritviz",
      "color": Colors.lightBlue[200],
      "duration": "3:42",
    },
    {
      "name": "Liggi",
      "img": "assets/albums/ved.png",
      "artist": "Ritviz",
      "color": Colors.lightBlue[200],
      "duration": "4:09",
    },
    {
      "name": "Sage",
      "img": "assets/albums/ved.png",
      "artist": "Ritviz",
      "color": Colors.lightBlue[200],
      "duration": "3:00",
    },
    {
      "name": "Chalo Chalein",
      "img": "assets/albums/ved.png",
      "artist": "Ritviz",
      "color": Colors.lightBlue[200],
      "duration": "3:38",
    },
  ]
};
