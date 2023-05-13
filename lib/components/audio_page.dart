import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/controller_provider.dart';
import 'package:media_booster/model/utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<Audio_Provider>(context, listen: false)
        .assetsAudioPlayer
        .dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5.h),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              items: Provider.of<Global_Providre>(context, listen: false)
                  .playSlider
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Provider.of<Audio_Provider>(context, listen: false)
                            .initialization(
                          Audio(
                            e['song'],
                          ),
                        );
                        title = e['song'];
                        name = e['title'];
                        singerName = e['Artist'];
                        imagePath = e['image'];
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(2.h),
                                    color: Color(0xff1e142b),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.chevron_down,
                                                ),
                                              ),
                                              Text("Song",
                                                  style: AppThemes.darkTheme
                                                      .textTheme.displayMedium),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.more_horiz_outlined,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Stack(
                                            alignment: Alignment(0, -0.5),
                                            children: [
                                              Container(
                                                height: 50.h,
                                                width: 90.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      imagePath,
                                                    ),
                                                    fit: BoxFit.cover,
                                                    opacity: 0.3,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 25.h,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      imagePath,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100.w,
                                                  child: DefaultTextStyle(
                                                    style: const TextStyle(
                                                      fontSize: 30.0,
                                                      fontFamily: 'Agne',
                                                    ),
                                                    child: AnimatedTextKit(
                                                      animatedTexts: [
                                                        TypewriterAnimatedText(
                                                            name,
                                                            speed: Duration(
                                                                milliseconds:
                                                                    1000)),
                                                      ],
                                                      totalRepeatCount: 100000,
                                                      pause: const Duration(
                                                          milliseconds: 2000),
                                                      displayFullTextOnTap: true,
                                                      stopPauseOnTap: true,
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                singerName,
                                                style: AppThemes.darkTheme
                                                    .textTheme.displayMedium!
                                                    .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 1.4.h,
                                                  color: Colors.grey
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Card(
                                            color: Color(0xff1e142b),
                                            child: StreamBuilder(
                                              builder: (context, snapshot) {
                                                return Container(
                                                  child: StreamBuilder(
                                                      stream: Provider.of<
                                                                  Audio_Provider>(
                                                              context)
                                                          .assetsAudioPlayer
                                                          .currentPosition,
                                                      builder:
                                                          (BuildContext context,
                                                              AsyncSnapshot
                                                                  snapShot) {
                                                        Duration data = snapShot
                                                                .data ??
                                                            Duration(seconds: 0);

                                                        try {
                                                          Provider.of<Audio_Provider>(
                                                                  context)
                                                              .audio_model
                                                              .duration = Provider
                                                                  .of<Audio_Provider>(
                                                                      context)
                                                              .assetsAudioPlayer
                                                              .current
                                                              .value
                                                              ?.audio
                                                              .duration;
                                                        } catch (e) {
                                                          Provider.of<Audio_Provider>(
                                                                      context)
                                                                  .audio_model
                                                                  .duration =
                                                              Duration(
                                                                  seconds: 0);
                                                        }

                                                        return Container(
                                                          color:
                                                              Color(0xff1e142b),
                                                          child: Column(
                                                            children: [
                                                              Theme(
                                                                data: ThemeData(
                                                                  useMaterial3:
                                                                      true,
                                                                ),
                                                                child: Slider(
                                                                  min: 0,
                                                                  max: Provider.of<
                                                                              Audio_Provider>(
                                                                          context)
                                                                      .audio_model
                                                                      .duration!
                                                                      .inSeconds
                                                                      .toDouble(),
                                                                  value: data
                                                                      .inSeconds
                                                                      .toDouble(),
                                                                  thumbColor:
                                                                      null,
                                                                  onChanged:
                                                                      (val) {
                                                                    Provider.of<Audio_Provider>(
                                                                            context,
                                                                            listen:
                                                                                false)
                                                                        .assetsAudioPlayer
                                                                        .seek(
                                                                          Duration(
                                                                            seconds:
                                                                                val.toInt(),
                                                                          ),
                                                                        );
                                                                  },
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                      "${data.toString().split(".")[0]}"),
                                                                  Text(
                                                                      "${Provider.of<Audio_Provider>(context).audio_model.duration.toString().split(".")[0]}"),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<Audio_Provider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .previous10();
                                                                    },
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .skip_previous_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      Provider.of<Audio_Provider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .previous();
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .skip_previous_rounded,
                                                                    ),
                                                                  ),
                                                                  Stack(
                                                                    alignment: Alignment.center,
                                                                    children: [
                                                                      CircleAvatar(
                                                                        radius:
                                                                        14,
                                                                      ),
                                                                      IconButton(
                                                                        onPressed:
                                                                            () async {
                                                                          Provider.of<AudioStopPlayButton_Provider>(context,
                                                                              listen: false)
                                                                              .AlternateValue();
                                                                          if (Provider.of<AudioStopPlayButton_Provider>(context, listen: false).audioStopPlayButton_Model.PlayMode ==
                                                                              false) {
                                                                            Provider.of<Audio_Provider>(context, listen: false)
                                                                                .pause();
                                                                          } else {
                                                                            Provider.of<Audio_Provider>(context, listen: false)
                                                                                .play();
                                                                          }
                                                                        },
                                                                        icon: Provider.of<AudioStopPlayButton_Provider>(context)
                                                                            .audioStopPlayButton_Model
                                                                            .PlayMode == false
                                                                            ? Icon(
                                                                          Icons.stop,
                                                                        )
                                                                            : Icon(
                                                                            Icons.play_arrow),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<Audio_Provider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .next();
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .skip_next_rounded,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      Provider.of<Audio_Provider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .previous10();
                                                                    },
                                                                    icon: Icon(
                                                                      Icons
                                                                          .forward_10_rounded,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                  image: AssetImage(
                                    e['image'],
                                  ),
                                  fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  offset: Offset(0, 5),
                                  color: Colors.primaries[
                                      Provider.of<VideoList_Provider>(context)
                                              .playSlider
                                              .indexOf(e) %
                                          18],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 3.h,
                                backgroundColor: Colors.primaries[
                                    Provider.of<Global_Providre>(context)
                                            .playSlider
                                            .indexOf(e) %
                                        18],
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<Audio_Provider>(context, listen: false)
                                      .initialization(
                                    Audio(
                                      e['song'],
                                    ),
                                  );
                                  title = e['song'];
                                  name = e['title'];
                                  singerName = e['Artist'];
                                  imagePath = e['image'];
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (context) {
                                        return Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(2.h),
                                              color: Color(0xff1e142b),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          icon: Icon(
                                                            CupertinoIcons.chevron_down,
                                                          ),
                                                        ),
                                                        Text("Song",
                                                            style: AppThemes.darkTheme
                                                                .textTheme.displayMedium),
                                                        IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.more_horiz_outlined,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    Stack(
                                                      alignment: Alignment(0, -0.5),
                                                      children: [
                                                        Container(
                                                          height: 50.h,
                                                          width: 90.w,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                imagePath,
                                                              ),
                                                              fit: BoxFit.cover,
                                                              opacity: 0.3,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 25.h,
                                                          width: 50.w,
                                                          decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage(
                                                                imagePath,
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            width: 100.w,
                                                            child: DefaultTextStyle(
                                                              style: const TextStyle(
                                                                fontSize: 30.0,
                                                                fontFamily: 'Agne',
                                                              ),
                                                              child: AnimatedTextKit(
                                                                animatedTexts: [
                                                                  TypewriterAnimatedText(
                                                                      name,
                                                                      speed: Duration(
                                                                          milliseconds:
                                                                          1000)),
                                                                ],
                                                                totalRepeatCount: 100000,
                                                                pause: const Duration(
                                                                    milliseconds: 2000),
                                                                displayFullTextOnTap: true,
                                                                stopPauseOnTap: true,
                                                                onTap: () {},
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          singerName,
                                                          style: AppThemes.darkTheme
                                                              .textTheme.displayMedium!
                                                              .copyWith(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 1.4.h,
                                                            color: Colors.grey
                                                                .withOpacity(0.7),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Card(
                                                      color: Color(0xff1e142b),
                                                      child: StreamBuilder(
                                                        builder: (context, snapshot) {
                                                          return Container(
                                                            child: StreamBuilder(
                                                                stream: Provider.of<
                                                                    Audio_Provider>(
                                                                    context)
                                                                    .assetsAudioPlayer
                                                                    .currentPosition,
                                                                builder:
                                                                    (BuildContext context,
                                                                    AsyncSnapshot
                                                                    snapShot) {
                                                                  Duration data = snapShot
                                                                      .data ??
                                                                      Duration(seconds: 0);

                                                                  try {
                                                                    Provider.of<Audio_Provider>(
                                                                        context)
                                                                        .audio_model
                                                                        .duration = Provider
                                                                        .of<Audio_Provider>(
                                                                        context)
                                                                        .assetsAudioPlayer
                                                                        .current
                                                                        .value
                                                                        ?.audio
                                                                        .duration;
                                                                  } catch (e) {
                                                                    Provider.of<Audio_Provider>(
                                                                        context)
                                                                        .audio_model
                                                                        .duration =
                                                                        Duration(
                                                                            seconds: 0);
                                                                  }

                                                                  return Container(
                                                                    color:
                                                                    Color(0xff1e142b),
                                                                    child: Column(
                                                                      children: [
                                                                        Theme(
                                                                          data: ThemeData(
                                                                            useMaterial3:
                                                                            true,
                                                                          ),
                                                                          child: Slider(
                                                                            min: 0,
                                                                            max: Provider.of<
                                                                                Audio_Provider>(
                                                                                context)
                                                                                .audio_model
                                                                                .duration!
                                                                                .inSeconds
                                                                                .toDouble(),
                                                                            value: data
                                                                                .inSeconds
                                                                                .toDouble(),
                                                                            thumbColor:
                                                                            null,
                                                                            onChanged:
                                                                                (val) {
                                                                              Provider.of<Audio_Provider>(
                                                                                  context,
                                                                                  listen:
                                                                                  false)
                                                                                  .assetsAudioPlayer
                                                                                  .seek(
                                                                                Duration(
                                                                                  seconds:
                                                                                  val.toInt(),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                                "${data.toString().split(".")[0]}"),
                                                                            Text(
                                                                                "${Provider.of<Audio_Provider>(context).audio_model.duration.toString().split(".")[0]}"),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Provider.of<Audio_Provider>(
                                                                                    context,
                                                                                    listen:
                                                                                    false)
                                                                                    .previous10();
                                                                              },
                                                                              icon:
                                                                              const Icon(
                                                                                Icons
                                                                                    .skip_previous_outlined,
                                                                                color: Colors
                                                                                    .white,
                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed:
                                                                                  () async {
                                                                                Provider.of<Audio_Provider>(
                                                                                    context,
                                                                                    listen:
                                                                                    false)
                                                                                    .previous();
                                                                              },
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .skip_previous_rounded,
                                                                              ),
                                                                            ),
                                                                            Stack(
                                                                              alignment: Alignment.center,
                                                                              children: [
                                                                                CircleAvatar(
                                                                                  radius:
                                                                                  14,
                                                                                ),
                                                                                IconButton(
                                                                                  onPressed:
                                                                                      () async {

                                                                                    if (Provider.of<AudioStopPlayButton_Provider>(context, listen: false).audioStopPlayButton_Model.PlayMode ==
                                                                                        false) {
                                                                                      Provider.of<Audio_Provider>(context, listen: false)
                                                                                          .pause();
                                                                                    } else {
                                                                                      Provider.of<Audio_Provider>(context, listen: false)
                                                                                          .play();
                                                                                    }
                                                                                    Provider.of<AudioStopPlayButton_Provider>(context,
                                                                                        listen: false)
                                                                                        .AlternateValue();
                                                                                  },
                                                                                  icon: Provider.of<AudioStopPlayButton_Provider>(context)
                                                                                      .audioStopPlayButton_Model
                                                                                      .PlayMode == false
                                                                                      ? Icon(
                                                                                    Icons.stop,
                                                                                  )
                                                                                      : Icon(
                                                                                      Icons.play_arrow),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            IconButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Provider.of<Audio_Provider>(
                                                                                    context,
                                                                                    listen:
                                                                                    false)
                                                                                    .next();
                                                                              },
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .skip_next_rounded,
                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed:
                                                                                  () {
                                                                                Provider.of<Audio_Provider>(
                                                                                    context,
                                                                                    listen:
                                                                                    false)
                                                                                    .previous10();
                                                                              },
                                                                              icon: Icon(
                                                                                Icons
                                                                                    .forward_10_rounded,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.play_arrow,
                                  size: 5.h,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 30.h,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayInterval: Duration(milliseconds: 2000),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ...Provider.of<Global_Providre>(context, listen: false)
                .initializationListTile()
                .map(
                  (e) => Card(
                    color: Colors
                        .primaries[Provider.of<Global_Providre>(context)
                                .playListTile
                                .indexOf(e) %
                            18]
                        .shade300,
                    child: ListTile(
                      title: Text(
                        e['title'],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 1.7.h,
                        ),
                      ),
                      subtitle: Text(
                        e['Artist'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 1.4.h),
                      ),
                      leading: CircleAvatar(
                        radius: 7.w,
                        backgroundColor: Colors
                            .primaries[Provider.of<Global_Providre>(context)
                                    .playListTile
                                    .indexOf(e) %
                                18]
                            .shade900,
                        foregroundImage: AssetImage(
                          e['image'],
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<Audio_Provider>(context, listen: false)
                              .initialization(
                            Audio(
                              e['song'],
                            ),
                          );
                          title = e['song'];
                          name = e['title'];
                          singerName = e['Artist'];
                          imagePath = e['image'];
                        },
                        icon: Icon(
                          CupertinoIcons.play_arrow_solid,
                          color: Colors
                              .primaries[Provider.of<Global_Providre>(context)
                                      .playListTile
                                      .indexOf(e) %
                                  18]
                              .shade900,
                          shadows: [
                            Shadow(
                              blurRadius: 5,
                              offset: Offset(2, 5),
                              color: Colors
                                  .primaries[
                                      Provider.of<Global_Providre>(context)
                                              .playListTile
                                              .indexOf(e) %
                                          18]
                                  .shade700,
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Provider.of<Audio_Provider>(context, listen: false)
                            .initialization(
                          Audio(
                            e['song'],
                          ),
                        );
                        title = e['song'];
                        name = e['title'];
                        singerName = e['Artist'];
                        imagePath = e['image'];
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) {
                              return Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(2.h),
                                color: Color(0xff1e142b),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              CupertinoIcons.chevron_down,
                                            ),
                                          ),
                                          Text("Song",
                                              style: AppThemes.darkTheme.textTheme
                                                  .displayMedium),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.more_horiz_outlined,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Stack(
                                        alignment: Alignment(0, -0.5),
                                        children: [
                                          Container(
                                            height: 50.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  imagePath,
                                                ),
                                                fit: BoxFit.cover,
                                                opacity: 0.3,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  imagePath,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100.w,
                                              child: DefaultTextStyle(
                                                style: const TextStyle(
                                                  fontSize: 30.0,
                                                  fontFamily: 'Agne',
                                                ),
                                                child: AnimatedTextKit(
                                                  animatedTexts: [
                                                    TypewriterAnimatedText(name,
                                                        speed: Duration(
                                                            milliseconds: 1000)),
                                                  ],
                                                  totalRepeatCount: 100000,
                                                  pause: const Duration(
                                                      milliseconds: 2000),
                                                  displayFullTextOnTap: true,
                                                  stopPauseOnTap: true,
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            singerName,
                                            style: AppThemes.darkTheme.textTheme
                                                .displayMedium!
                                                .copyWith(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 1.4.h,
                                              color: Colors.grey.withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Card(
                                        color: Color(0xff1e142b),
                                        child: StreamBuilder(
                                          builder: (context, snapshot) {
                                            return Container(
                                              child: StreamBuilder(
                                                  stream:
                                                      Provider.of<Audio_Provider>(
                                                              context)
                                                          .assetsAudioPlayer
                                                          .currentPosition,
                                                  builder: (BuildContext context,
                                                      AsyncSnapshot snapShot) {
                                                    Duration data =
                                                        snapShot.data ??
                                                            Duration(seconds: 0);

                                                    try {
                                                      Provider.of<Audio_Provider>(
                                                              context)
                                                          .audio_model
                                                          .duration = Provider.of<
                                                                  Audio_Provider>(
                                                              context)
                                                          .assetsAudioPlayer
                                                          .current
                                                          .value
                                                          ?.audio
                                                          .duration;
                                                    } catch (e) {
                                                      Provider.of<Audio_Provider>(
                                                                  context)
                                                              .audio_model
                                                              .duration =
                                                          Duration(seconds: 0);
                                                    }

                                                    return Container(
                                                      color: Color(0xff1e142b),
                                                      child: Column(
                                                        children: [
                                                          Theme(
                                                            data: ThemeData(
                                                              useMaterial3: true,
                                                            ),
                                                            child: Slider(
                                                              min: 0,
                                                              max: Provider.of<
                                                                          Audio_Provider>(
                                                                      context)
                                                                  .audio_model
                                                                  .duration!
                                                                  .inSeconds
                                                                  .toDouble(),
                                                              value: data
                                                                  .inSeconds
                                                                  .toDouble(),
                                                              thumbColor: null,
                                                              onChanged: (val) {
                                                                Provider.of<Audio_Provider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .assetsAudioPlayer
                                                                    .seek(
                                                                      Duration(
                                                                        seconds: val
                                                                            .toInt(),
                                                                      ),
                                                                    );
                                                              },
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "${data.toString().split(".")[0]}"),
                                                              Text(
                                                                  "${Provider.of<Audio_Provider>(context).audio_model.duration.toString().split(".")[0]}"),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {
                                                                  Provider.of<Audio_Provider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .previous10();
                                                                },
                                                                icon: const Icon(
                                                                  Icons
                                                                      .skip_previous_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  Provider.of<Audio_Provider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .previous();
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .skip_previous_rounded,
                                                                ),
                                                              ),
                                                              Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                children: [
                                                                  CircleAvatar(
                                                                    radius: 14,
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      Provider.of<AudioStopPlayButton_Provider>(
                                                                              context,
                                                                              listen:
                                                                                  false)
                                                                          .AlternateValue();
                                                                      if (Provider.of<AudioStopPlayButton_Provider>(context,
                                                                                  listen: false)
                                                                              .audioStopPlayButton_Model
                                                                              .PlayMode ==
                                                                          false) {
                                                                        Provider.of<Audio_Provider>(
                                                                                context,
                                                                                listen: false)
                                                                            .pause();
                                                                      } else {
                                                                        Provider.of<Audio_Provider>(
                                                                                context,
                                                                                listen: false)
                                                                            .play();
                                                                      }
                                                                    },
                                                                    icon: Provider.of<AudioStopPlayButton_Provider>(
                                                                                context)
                                                                            .audioStopPlayButton_Model
                                                                            .PlayMode == false
                                                                        ? Icon(
                                                                            Icons
                                                                                .stop,
                                                                          )
                                                                        : Icon(Icons
                                                                            .play_arrow),
                                                                  ),
                                                                ],
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  Provider.of<Audio_Provider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .next();
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .skip_next_rounded,
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  Provider.of<Audio_Provider>(
                                                                          context,
                                                                          listen:
                                                                              false)
                                                                      .previous10();
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .forward_10_rounded,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                )
                .toList().reversed
          ],
        ),
      ),
    );
  }

  Widget container({required context1, required image}) {
    return Column(
      children: [
        Container(
          height: 14.h,
          width: 30.w,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.music_note,
          ),
        ),
        Text(
          context1,
          style: AppThemes.darkTheme.textTheme.displayMedium!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 2.h,
          ),
        ),
      ],
    );
  }
}
