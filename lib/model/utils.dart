import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/components/audio_page.dart';
import 'package:media_booster/components/video_page.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.deepPurple,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.white,
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

List<Map<String, dynamic>> tabs = [
  {
    'page': AudioPage(),
    'title': "SONG",
    'icon': CupertinoIcons.music_albums_fill,
  },
  {
    'page': VideoPage(),
    'title': "SONG",
    'icon': Icons.video_collection_rounded,
  },
];

List<Map<String, dynamic>> rightPlayList = [
  {
    'Image': "assets/part_02/sulthan.jpg",
    'Text': "Liked Songs",
    'Audio1': "assets/songs/holly_song/cheap.mp3",
    'name1': "Cheap Thrills",
    'singerName1': "Sia",
    'imagePath1': "assets/part_01/sia.jpg",
    'Audio2': "assets/songs/holly_song/closer.mp3",
    'name2': "Closer",
    'singerName2': "Chainsmokers",
    'imagePath2': "assets/part_01/closer.jpg",
    'Audio3': "assets/songs/holly_song/despa.mp3",
    'name3': "Despacito ",
    'singerName3': "Luis Fonsi",
    'imagePath3': "assets/part_01/despa.jpg",
    'Audio4': "assets/songs/holly_song/light.mp3",
    'name4': "Blinding Lights",
    'singerName4': "The Weeknd",
    'imagePath4': "assets/part_01/light.png",
    'Audio5': "assets/songs/holly_song/unstop.mp3",
    'name5': "Unstoppable ",
    'singerName5': "Sia",
    'imagePath5': "assets/part_01/sia.jpg",
    'Audio6': "assets/songs/holly_song/we_don't.mp3",
    'name6': "We Don't Talk Anymore",
    'singerName6': "Charlie Puth",
    'imagePath6': "assets/part_01/we_don't.jpg",
  },
  {
    'Image': "assets/images/dangal.jpeg",
    'Text': "Dangal",
    'Audio1': "assets/songs/bolly_song/mehbooba.mp3",
    'name1': "Mehbooba O",
    'singerName1': "Rahul Dev Barman",
    'imagePath1': "assets/part_02/mahebooba.jpg",
    'Audio2': "assets/songs/bolly_song/salaam.mp3",
    'name2': "Salaam RockyBhai",
    'singerName2': "Ravi Basrur",
    'imagePath2': "assets/part_02/salaam.jpg",
    'Audio3': "assets/songs/bolly_song/sawan.mp3",
    'name3': "Sawan Meein Lag Gayi Aag",
    'singerName3': "Mika Singh",
    'imagePath3': "assets/part_02/sawan.jpg",
    'Audio4': "assets/songs/bolly_song/sheila.mp3",
    'name4': "Sheila Ki Jawani",
    'singerName4': "Vishal Dadlani",
    'imagePath4': "assets/part_02/sheila.jpg",
    'Audio5': "assets/songs/bolly_song/so.mp3",
    'name5': "So High",
    'singerName5': "Sidhu Moose Wala",
    'imagePath5': "assets/part_02/so.jpg",
    'Audio6': "assets/songs/bolly_song/sultan.mp3",
    'name6': "Sultan",
    'singerName6': "Ali Khan",
    'imagePath6': "assets/part_02/sulthan.jpg",
  },
  {
    'Image': "assets/images/sultan.jpg",
    'Text': "Song",
    'Audio1': "assets/songs/bolly_song/sulthan.mp3",
    'name1': "Sulthan-KGF",
    'singerName1': "Yuvan Shankar Raja",
    'imagePath1': "assets/images/sultan.jpg",
    'Audio2': "assets/songs/bolly_song/swag.mp3",
    'name2': "Swag Se Swagat",
    'singerName2': "Julius Packiam",
    'imagePath2': "assets/part_03/swag.jpg",
    'Audio3': "assets/songs/bolly_song/toofan.mp3",
    'name3': "Toofan-KGF",
    'singerName3': "Brijesh Shandilya",
    'imagePath3': "assets/part_03/toofan.jpg",
    'Audio4': "assets/songs/bolly_song/sheila.mp3",
    'name4': "Sheila Ki Jawani",
    'singerName4': "Sunidhi Chauhan",
    'imagePath4': "assets/part_03/sheila.jpg",
    'Audio5': "assets/songs/bolly_song/wallah.mp3",
    'name5': "Wallah Wallah",
    'singerName5': "Ishaan Khan",
    'imagePath5': "assets/part_03/wallah.jpg",
    'Audio6': "assets/songs/bolly_song/afghan.mp3",
    'name6': "Afghan Jalebi (Ya Baba)",
    'singerName6': "Asrar",
    'imagePath6': "assets/part_03/afghan.jpg",
  },
  {
    'Image': "assets/images/shiddat.jpg",
    'Text': "KK",
    'Audio1': "assets/songs/bolly_song/afghan.mp3",
    'name1': "Afghan Jalebi (Ya Baba)",
    'singerName1': "Asrar",
    'imagePath1': "assets/part_03/afghan.jpg",
    'Audio2': "assets/songs/bolly_song/anarkali.mp3",
    'name2': "Anarkali Disco Chali",
    'singerName2': "Mamta Sharma",
    'imagePath2': "assets/part_04/anarkali.jpg",
    'Audio3': "assets/songs/bolly_song/ghagra.mp3",
    'name3': "Ghagra",
    'singerName3': "Rekha Bhardwaj",
    'imagePath3': "assets/part_04/ghagra.jpg",
    'Audio4': "assets/songs/bolly_song/guru.mp3",
    'name4': "High Rated Gabru ",
    'singerName4': "Guru Randhawa",
    'imagePath4': "assets/part_04/guru.jpg",
    'Audio5': "assets/songs/bolly_song/janeman.mp3",
    'name5': "JAANEMAN AAH",
    'singerName5': "Antara Mitra",
    'imagePath5': "assets/part_04/jaaneman.jpg",
    'Audio6': "assets/songs/bolly_song/laila.mp3",
    'name6': "Laila Main Laila",
    'singerName6': "Pawni A Pandey",
    'imagePath6': "assets/part_04/laila.jpg",
  },
];


String title = "assets/songs/bolly_song/sultan.mp3";
String name = "Sultan";
String singerName = "Ali";
String imagePath = "assets/part_02/sulthan.jpg";

String titleV = "assets/songs/bolly_video/dwarka.mp4";
String nameV = "Dwarika Ma Machavi Dhun";
String singerNameV = "Kirtidan Gadhvi";
String imagePathV = "assets/images/dwarka.jpg";