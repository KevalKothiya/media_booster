import 'package:flutter/material.dart';
import 'package:media_booster/model/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Media Booster"),
        centerTitle: true,
        bottom: TabBar(
            controller: tabController,
            tabs: tabs
                .map(
                  (e) => Tab(
                    icon: Icon(
                      e['icon'],
                    ),
                    text: e['title'],
                  ),
                )
                .toList()),
        bottomOpacity: 1,
        actions: [],
      ),
      body: TabBarView(
        controller: tabController,
        children: tabs
            .map<Widget>(
              (e) => e['page'],
            )
            .toList(),
      ),
      // bottomNavigationBar: (Provider.of<Audio_Provider>(context)
      //             .assetsAudioPlayer
      //             .isPlaying ==
      //         false)
      //     ? Container()
      //     : StreamBuilder<Duration>(
      //       stream: Provider.of<Audio_Provider>(context)
      //           .assetsAudioPlayer
      //           .currentPosition,
      //       builder: (context, snapshot) {
      //               Duration data = snapshot.data ?? Duration(seconds: 0);
      //         try {
      //           Provider.of<Audio_Provider>(context)
      //               .audio_model.duration = Provider.of<Audio_Provider>(context)
      //               .assetsAudioPlayer.current.value?.audio.duration;
      //         } catch (e) {
      //           Provider.of<Audio_Provider>(context)
      //               .audio_model.duration = Duration(seconds: 0);
      //         }
      //         return Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //         AnimatedContainer(
      //           duration: Duration(
      //             milliseconds: 500,
      //           ),
      //           color: Colors.blueGrey,
      //           height: 50,
      //           child: Row(
      //             children: [
      //               Image.asset(imagePath),
      //               Text(name),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: [
      //                   Container(
      //                     alignment: AlignmentDirectional.centerEnd,
      //                     child: IconButton(
      //                       onPressed: () {},
      //                       icon: (Provider.of<Audio_Provider>(context)
      //                           .assetsAudioPlayer
      //                           .isPlaying ==
      //                           true)
      //                           ? Icon(
      //                         Icons.play_arrow,
      //                       )
      //                           : Icon(
      //                         Icons.stop,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //         // StreamBuilder<Duration>(
      //         //     stream: Provider.of<Audio_Provider>(context)
      //         //         .assetsAudioPlayer
      //         //         .currentPosition,
      //         //     builder: (context, snapshot) {
      //         //       Duration data = snapshot.data ?? Duration(seconds: 0);
      //         //       return LinearProgressIndicator(
      //         //         value: data.inSeconds.toDouble() /
      //         //             Provider.of<Audio_Provider>(context, listen: false)
      //         //                 .audio_model
      //         //                 .duration!
      //         //                 .inSeconds
      //         //                 .toDouble(),
      //         //       );
      //         //     }
      //         // ),
      //     Slider(
      //       min: 0,
      //       max: Provider.of<Audio_Provider>(context)
      //           .audio_model
      //           .duration!
      //           .inSeconds
      //           .toDouble(),
      //       value: data.inSeconds.toDouble(),
      //       onChanged: (val) {
      //         Provider.of<Audio_Provider>(context, listen: false)
      //             .assetsAudioPlayer
      //             .seek(
      //           Duration(
      //             seconds: val.toInt(),
      //           ),
      //         );
      //       },
      //     )
      //   ],
      // );
      //       }
      //     ),
    );
  }
}
