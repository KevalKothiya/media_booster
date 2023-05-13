import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/controller_provider.dart';
import 'package:media_booster/model/utils.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.5.h),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: Provider.of<VideoList_Provider>(context, listen: false)
                  .playSlider
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Provider.of<Video_Provider>(context, listen: false)
                            .initialization(
                          e['video'],
                        );
                        Navigator.of(context)
                            .pushNamed('VideoPageDetails', arguments: e);
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
                                    Provider.of<VideoList_Provider>(context)
                                            .playSlider
                                            .indexOf(e) %
                                        18],
                              ),
                              IconButton(
                                icon: Icon(
                                    Icons.play_arrow,
                                    size: 5.h,
                                ),
                                onPressed: () {
                                  Provider.of<Video_Provider>(context, listen: false)
                                      .initialization(
                                    e['video'],
                                  );
                                  Navigator.of(context)
                                      .pushNamed('VideoPageDetails', arguments: e);
                                },
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
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ...Provider.of<VideoList_Provider>(context, listen: false)
                .playList
                .map(
                  (e) => Card(
                    color: Colors
                        .primaries[Provider.of<VideoList_Provider>(context)
                                .playList
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
                          Provider.of<Video_Provider>(context, listen: false)
                              .initialization(e['video']);
                          titleV = e['video'];
                          nameV = e['title'];
                          singerNameV = e['Artist'];
                          imagePathV = e['image'];
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
                        titleV = e['video'];
                        nameV = e['title'];
                        singerNameV = e['Artist'];
                        imagePathV = e['image'];

                        Provider.of<Video_Provider>(context, listen: false)
                            .initialization(
                          e['video'],
                        );
                        Navigator.of(context)
                            .pushNamed('VideoPageDetails', arguments: e);

                        // optionsBuilder: (context, defaultOptions) async {
                        //   await showCupertinoModalPopup(
                        //       context: context,
                        //       builder: (context) {
                        //         return Container(
                        //           alignment: Alignment.center,
                        //           padding: EdgeInsets.all(2.h),
                        //           color: Color(0xff1e142b),
                        //           child: AspectRatio(
                        //             aspectRatio:
                        //             Provider.of<Video_Provider>(context)
                        //                 .videoPlayerController
                        //                 .value
                        //                 .aspectRatio,
                        //             child: Chewie(
                        //               controller: chewieController,
                        //               ),
                        //           ),
                        //         );
                        //       });
                        // };
                      },
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
