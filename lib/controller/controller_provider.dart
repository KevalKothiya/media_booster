import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/model/globals.dart';
import 'package:video_player/video_player.dart';

class VideoStopPlayButton_Provider extends ChangeNotifier {
  VideoStopPlayButton_Model videoStopPlayButton_Model =
      VideoStopPlayButton_Model(PlayMode: false);

  AlternateValue() async {
    videoStopPlayButton_Model.PlayMode = !videoStopPlayButton_Model.PlayMode;
    notifyListeners();
  }
}

class AudioStopPlayButton_Provider extends ChangeNotifier {
  AudioStopPlayButton_Model audioStopPlayButton_Model =
      AudioStopPlayButton_Model(PlayMode: false);

  AlternateValue() async {
    audioStopPlayButton_Model.PlayMode = !audioStopPlayButton_Model.PlayMode;
    notifyListeners();
  }
}

class Audio_Provider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  Audio_Model audio_model = Audio_Model(Duration(seconds: 0));

  initialization(Audio song) {
    assetsAudioPlayer.open(
      song,
      // autoStart: false,
    );
    // assetsAudioPlayer.open(
    //   Playlist(
    //     audios: [
    //       Audio.network(
    //         "https://wynk.in/music/song/salaam-rocky-bhai/bl_A10320WT043367361O?q=salaam+",
    //         metas: Metas(
    //             title: "Salaam RockyBhai",
    //             image: MetasImage.asset("assets/part_02/salaam.jpg"),
    //             artist: "Ravi Basrur"),
    //       ),Audio.network(
    //         "https://wynk.in/music/song/sulthan/bl_A10320WT043280853U?q=Sulthan",
    //         metas: Metas(
    //             title: "Sulthan",
    //             image: MetasImage.asset("assets/part_02/sulthan.jpg"),
    //             artist: "Yuvan Shankar Raja"),
    //       ),Audio.network(
    //         "https://wynk.in/music/song/sultan/un_M0903040?q=Sultan",
    //         metas: Metas(
    //             title: "Sultan",
    //             image: MetasImage.asset("assets/images/sultan_s.jpg"),
    //             artist: "Ali Khan"),
    //       ),
    //     ],
    //     startIndex: 0,
    //   ),
    //   autoStart: true,
    //   playInBackground: PlayInBackground.enabled,
    //   showNotification: true,
    //   headPhoneStrategy: HeadPhoneStrategy.pauseOnUnplug,
    // );

    try {
      audio_model.duration = assetsAudioPlayer.current.value?.audio.duration;
    } catch (e) {
      audio_model.duration = Duration(seconds: 0);
    }

    notifyListeners();
  }

  play() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  next() async {
    await assetsAudioPlayer.next();
    notifyListeners();
  }

  previous() async {
    await assetsAudioPlayer.previous();
    notifyListeners();
  }
  previous10() async {
    await assetsAudioPlayer.seekBy(Duration(seconds: -10));
    notifyListeners();
  }
  next10() async {
    await assetsAudioPlayer.seekBy(Duration(seconds: 10));
    notifyListeners();
  }

}
class Video_Provider extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;

  Audio_Model audio_model = Audio_Model(Duration(seconds: 0));

  initialization(String path) async {
    videoPlayerController = VideoPlayerController.asset(path);

    await videoPlayerController.initialize();
    notifyListeners();
  }

  play() async {
    await videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    await videoPlayerController.pause();
    notifyListeners();
  }

}

class VideoList_Provider extends ChangeNotifier{
  List<Map<String, dynamic>> playList = [
    {
      'Artist': "Kirtidan Gadhvi",
      'title': "Dwarika Ma Machavi Dhun",
      'image': "assets/images/dwarka.jpg",
      'video': "assets/songs/bolly_video/dwarka.mp4",
    },
    {
      'Artist': "Sukhwinder Singh",
      'title': "Maay Bhanai",
      'image': "assets/images/maay.jpg",
      'video': "assets/songs/bolly_video/maay.mp4",
    },
    {
      'Artist': "Rajbha Gadhvi",
      'title': "Mogal No Melo",
      'image': "assets/images/mogal.jpeg",
      'video': "assets/songs/bolly_video/mogal.mp4",
    },
    {
      'Artist': "MayaBhai Ahir",
      'title': "Shri Ram Jai Ram",
      'image': "assets/images/ram.jpeg",
      'video': "assets/songs/bolly_video/ram.mp4",
    },
    {
      'Artist': "Rapperiya Baalam",
      'title': "Shoorveer-3",
      'image': "assets/images/sivaji.jpg",
      'video': "assets/songs/bolly_video/shoor.mp4",
    },
    {
      'Artist': "Rajbha Gadhvi",
      'title': "Dwarika Na Nath ni vat j na thay",
      'image': "assets/images/sivaji.jpg",
      'video': "assets/songs/bolly_video/vat.mp4",
    },
    {
      'Artist': "Sidhu Moose Wala",
      'title': "So High",
      'image': "assets/images/so.jpg",
      'video': "assets/songs/bolly_video/so.mp4",
    },
    {
      'Artist': "Ali Khan",
      'title': "Sultan",
      'image': "assets/images/sultan_s.jpg",
      'video': "assets/songs/bolly_video/sultan.mp4",
    },
  ];
  List<Map<String, dynamic>> playSlider = [
    {
      'Artist': "Daler Mehndi ",
      'title': "Aasman Ko Chukar",
      'image': "assets/images/hanuman.jpeg",
      'video': "assets/songs/bolly_video/aasma.mp4",
    },
    {
      'Artist': "Rapperiya Baalam",
      'title': "Maharana Pratap ",
      'image': "assets/images/shoorveer.jpeg",
      'video': "assets/songs/bolly_video/maharana.mp4",
    },
    {
      'Artist': "Hemant Chauhan",
      'title': "Shiv Tandav",
      'image': "assets/images/shiv.jpeg",
      'video': "assets/songs/bolly_video/shiv.mp4",
    },
    {
      'Artist': "Rapperiya Baalam",
      'title': "Shoorveer-3",
      'image': "assets/images/sivaji.jpg",
      'video': "assets/songs/bolly_video/shoor.mp4",
    },
    {
      'Artist': "Rajbha Gadhvi",
      'title': "Chapakaru",
      'image': "assets/images/chapakaru.jpeg",
      'video': "assets/songs/bolly_video/chapakaru.mp4",
    },
    {
      'Artist': "Osman Mir",
      'title': "Mor Bani Thanghat Kare",
      'image': "assets/images/mor.jpg",
      'video': "assets/songs/bolly_video/mor.mp4",
    },
  ];

  List<Map<String, dynamic>> initialization() {
    return playList;
  }
}

class Global_Providre extends ChangeNotifier {
  List<Map<String, dynamic>> playListTile = <Map<String, dynamic>>[
    {
      'Artist': "Sia",
      'title': "Cheap Thrills",
      'image': "assets/part_01/sia.jpg",
      'song': "assets/songs/holly_song/cheap.mp3",
    },
    {
      'Artist': "Chainsmokers",
      'title': "Closer",
      'image': "assets/part_01/closer.jpg",
      'song': "assets/songs/holly_song/closer.mp3"
    },
    {
      'song': "assets/songs/holly_song/despa.mp3",
      'title': "Despacito ",
      'Artist': "Luis Fonsi",
      'image': "assets/images/despa.jpg",
    },
    {
      'song': "assets/songs/holly_song/light.mp3",
      'title': "Blinding Lights",
      'Artist': "The Weeknd",
      'image': "assets/part_01/light.png",
    },
    {
      'song': "assets/songs/holly_song/unstop.mp3",
      'title': "Unstoppable ",
      'Artist': "Sia",
      'image': "assets/part_01/sia.jpg",
    },
    {
      'song': "assets/songs/holly_song/we_don't.mp3",
      'title': "We Don't Talk Anymore",
      'Artist': "Charlie Puth",
      'image': "assets/part_01/we_don't.jpg",
    },
    {
      'song': "assets/songs/bolly_song/mehbooba.mp3",
      'title': "Mehbooba O",
      'Artist': "Rahul Dev Barman",
      'image': "assets/part_02/mahebooba.jpg",
    },
    {
      'song': "assets/songs/bolly_song/salaam.mp3",
      'title': "Salaam RockyBhai",
      'Artist': "Ravi Basrur",
      'image': "assets/part_02/salaam.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sawan.mp3",
      'title': "Sawan Meein Lag",
      'Artist': "Mika Singh",
      'image': "assets/part_02/sawan.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sheila.mp3",
      'title': "Sheila Ki Jawani",
      'Artist': "Vishal Dadlani",
      'image': "assets/part_02/sheila.jpg",
    },
    {
      'song': "assets/songs/bolly_song/so.mp3",
      'title': "So High",
      'Artist': "Sidhu Moose Wala",
      'image': "assets/images/so.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sultan.mp3",
      'title': "Sultan",
      'Artist': "Ali Khan",
      'image': "assets/images/sultan_s.jpg",
    },
  ];
  List<Map<String, dynamic>> playSlider = <Map<String, dynamic>>[
    {
      'Artist': "Sia",
      'title': "Cheap Thrills",
      'image': "assets/part_01/sia.jpg",
      'song': "assets/songs/holly_song/cheap.mp3",
    },
    {
      'Artist': "Chainsmokers",
      'title': "Closer",
      'image': "assets/part_01/closer.jpg",
      'song': "assets/songs/holly_song/closer.mp3"
    },
    {
      'song': "assets/songs/holly_song/despa.mp3",
      'title': "Despacito ",
      'Artist': "Luis Fonsi",
      'image': "assets/images/despa.jpg",
    },
    {
      'song': "assets/songs/holly_song/light.mp3",
      'title': "Blinding Lights",
      'Artist': "The Weeknd",
      'image': "assets/part_01/light.png",
    },
    {
      'song': "assets/songs/holly_song/unstop.mp3",
      'title': "Unstoppable ",
      'Artist': "Sia",
      'image': "assets/part_01/sia.jpg",
    },
    {
      'song': "assets/songs/holly_song/we_don't.mp3",
      'title': "We Don't Talk Anymore",
      'Artist': "Charlie Puth",
      'image': "assets/part_01/we_don't.jpg",
    },
    {
      'song': "assets/songs/bolly_song/mehbooba.mp3",
      'title': "Mehbooba O",
      'Artist': "Rahul Dev Barman",
      'image': "assets/part_02/mahebooba.jpg",
    },
    {
      'song': "assets/songs/bolly_song/salaam.mp3",
      'title': "Salaam RockyBhai",
      'Artist': "Ravi Basrur",
      'image': "assets/part_02/salaam.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sawan.mp3",
      'title': "Sawan Meein Lag",
      'Artist': "Mika Singh",
      'image': "assets/part_02/sawan.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sheila.mp3",
      'title': "Sheila Ki Jawani",
      'Artist': "Vishal Dadlani",
      'image': "assets/part_02/sheila.jpg",
    },
    {
      'song': "assets/songs/bolly_song/so.mp3",
      'title': "So High",
      'Artist': "Sidhu Moose Wala",
      'image': "assets/images/so.jpg",
    },
    {
      'song': "assets/songs/bolly_song/sultan.mp3",
      'title': "Sultan",
      'Artist': "Ali Khan",
      'image': "assets/images/sultan_s.jpg",
    },
  ];

  List<Map<String, dynamic>> initializationListTile() {
    return playListTile;
  }
  List<Map<String, dynamic>> initializationSlider() {
    return playSlider;
  }
}
