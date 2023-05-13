import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/controller/controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideoPageDetails extends StatefulWidget {
  const VideoPageDetails({Key? key}) : super(key: key);

  @override
  State<VideoPageDetails> createState() => _VideoPageDetailsState();
}

class _VideoPageDetailsState extends State<VideoPageDetails> {
  late ChewieController chewieController;

  let() async {
    chewieController = ChewieController(videoPlayerController: Provider.of<Video_Provider>(context,listen: false).videoPlayerController);
  }

  @override
  void initState() {
    super.initState();
    let();
  }

  Active() async {
    Provider.of<Video_Provider>(context,listen: false).videoPlayerController.dispose();
    Provider.of<Video_Provider>(context,listen: false).videoPlayerController.pause();
     chewieController.dispose();
  }
  @override
  void dispose() {
    super.dispose();
    Active();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(2.h),
          child: AspectRatio(
            aspectRatio:0.5,
            // Provider.of<Video_Provider>(context)
            //     .videoPlayerController
            //     .value
            //     .aspectRatio,
            child: Chewie(
              controller: chewieController,
            ),
          ),
        ),
      ),
    );
  }
}
