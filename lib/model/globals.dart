class VideoStopPlayButton_Model {
  bool PlayMode;

  VideoStopPlayButton_Model({
    required this.PlayMode,
  });
}

class AudioStopPlayButton_Model {
  bool PlayMode;

  AudioStopPlayButton_Model({
    required this.PlayMode,
  });
}

class Music_Model {
  String moviename;
  String image;
  String path;

  Music_Model(this.moviename, this.image, this.path);
}

class Audio_Model {
  Duration? duration;

  Audio_Model(this.duration);
}


class Global_Model {
  String Artist;
  String title;
  String image;
  String song;

  Global_Model({
    required this.Artist,
    required this.title,
    required this.image,
    required this.song,
  });
// static List mySongList = [
//   {
//     'Artist': 'Mohit Chauhan',
//     'title': 'Phir Se Udd Chala',
//     'image': 'Assets/Images/01 Phir se udd chala.jpeg',
//     'song': 'Assets/Audio/1.mp3',
//   },
//   {
//     'Artist': 'Shreya Ghosal',
//     'title': 'Sunn Raha Hai',
//     'image': 'Assets/Images/02 Sunn Raha Hai .jpg',
//     'song': 'Assets/Audio/2.mp3',
//   },
//   {
//     'Artist': 'Amit Trivedi',
//     'title': 'Namo Namo - Kedarnath',
//     'image': 'Assets/Images/03 Namo Namo - Kedarnath.jpg',
//     'song': 'Assets/Audio/7.mp3',
//   },
//   {
//     'Artist': 'Rekha Bhardwaj',
//     'title': 'Kabira',
//     'image': 'Assets/Images/04 Kabira.jpeg',
//     'song': 'Assets/Audio/8.mp3',
//   },
//   {
//     'Artist': 'Arjit Singh',
//     'title': 'Meri Aashiqui',
//     'image': 'Assets/Images/05 Sunn Raha Hai  copy.jpg',
//     'song': 'Assets/Audio/3.mp3',
//   },
//   {
//     'Artist': 'Shaan',
//     'title': 'Aao Milo Chalo',
//     'image': 'Assets/Images/06 Aao Milo Chalo.jpeg',
//     'song': 'Assets/Audio/9.mp3',
//   },
//   {
//     'Artist': 'Lucky Ali',
//     'title': 'Safarnama',
//     'image': 'Assets/Images/07 Safarnama.jpeg',
//     'song': 'Assets/Audio/4.mp3',
//   },
//   {
//     'Artist': 'Pritam,KK',
//     'title': 'zara sa',
//     'image': 'Assets/Images/08 zara sa.jpeg',
//     'song': 'Assets/Audio/10.mp3',
//   },
//   {
//     'Artist': 'Kishore Kumar',
//     'title': ' Zindagi Ek Safar Hai Suhana',
//     'image': 'Assets/Images/09 Zindagi Ek Safar Hai Suhana.jpeg',
//     'song': 'Assets/Audio/5.mp3',
//   },
//   {
//     'Artist': 'Arjit Singh',
//     'title': 'Tera Ye Ishq Mera Fitoor',
//     'image': 'Assets/Images/10 Tera Ye Ishq Mera Fitoor.jpeg',
//     'song': 'Assets/Audio/11.mp3',
//   },
//   {
//     'Artist': 'Arjit Singh',
//     'title': 'Ilahi',
//     'image': 'Assets/Images/11 Ilahi.jpeg',
//     'song': 'Assets/Audio/6.mp3',
//   },
//   {
//     'Artist': 'Amit Trivedi',
//     'title': 'Qaafirana - Kedarnath',
//     'image': 'Assets/Images/12 Qaafirana - Kedarnath.jpeg',
//     'song': 'Assets/Audio/12.mp3',
//   },
//   {
//     'Artist': 'Sunidhi',
//     'title': 'Saami Saami',
//     'image': 'Assets/Images/13 Shami Shami.jpeg',
//     'song': 'Assets/Audio/13.mp3',
//   },
//   {
//     'Artist': 'Arjit Singh',
//     'title': 'Sooraj Dooba Hain',
//     'image': 'Assets/Images/14 Sooraj Dooba Hain .jpeg',
//     'song': 'Assets/Audio/14.mp3',
//   },
//   {
//     'Artist': 'Darshan Raval',
//     'title': 'Tum Mere',
//     'image': 'Assets/Images/15 Tum Mere.jpeg',
//     'song': 'Assets/Audio/15.mp3',
//   },
// ];
}
