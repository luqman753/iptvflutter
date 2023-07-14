import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/constant.dart';
import '../Screens/webView.dart';
import '../size_config.dart';

class TrailorWebView extends StatefulWidget {
  final data;
  const TrailorWebView({Key? key, this.data}) : super(key: key);
  @override
  TtrailoWebViewrState createState() => TtrailoWebViewrState();
}

class TtrailoWebViewrState extends State<TrailorWebView> {
  String? trailerId;
  bool pauseVal = false;
  String? updatedId;
  int value = 0;
  YoutubePlayerController? videoController;
  YoutubeMetaData? videoMetaData;
  YoutubePlayerValue? videoValue;
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    trailerId = widget.data.trailer.toString().split("?")[0];
    updatedId = trailerId.toString().split("d/")[1];
    videoMetaData = const YoutubeMetaData();
    videoValue = YoutubePlayerValue();
    videoController = YoutubePlayerController(
        initialVideoId: updatedId!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          hideControls: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          // endAt: 29,
        ));
    videoMetaData = videoController!.metadata;

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});

      Future.delayed(const Duration(seconds: 8), () {
        videoController!.addListener(() {
          print(videoController!.metadata.duration.inSeconds);
          print(videoController!.value.position);
          if (videoController!.value.position.inSeconds ==
              videoController!.metadata.duration.inSeconds) {
            value == 0 ? returnfun() : const SizedBox();
            value++;
          }
        });
        //
      });
    });

    super.initState();
  }

  returnfun() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home(data: widget.data)),
    );
  }

  returnClass() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return returnClass();
      },
      child: Scaffold(
          body: Stack(
        children: [
          YoutubePlayer(
            showVideoProgressIndicator: true,
            aspectRatio: 16 / 9,
            controller: videoController!,
          ),
          Positioned(
              top: MySize.size40,
              right: MySize.size4,
              child: GestureDetector(
                onTap: () {
                  if (pauseVal == false) {
                    videoController!.pause();
                    pauseVal = true;
                    setState(() {});
                  } else {
                    videoController!.play();
                    pauseVal = false;
                    setState(() {});
                  }
                },
                child: const Icon(
                  Icons.info_rounded,
                  color: Colors.white,
                ),
              )),
          //////////// Story Line ///////////////////
          pauseVal == true
              ? Padding(
                  padding: EdgeInsets.only(
                    top: MySize.size1 * 100,
                    left: MySize.size1 * 550,
                  ),
                  child: Container(
                    height: MySize.size20 * 3,
                    width: MySize.size40 * 8.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [list1, list, list]),
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        Center(child: Text("Story Line", style: listTextStyle)),
                  ),
                )
              : const SizedBox(),

          /////////// Cast   ///////////////

          // pauseVal == true
          //     ? Padding(
          //         padding: EdgeInsets.only(
          //           top: MySize.size1 * 100,
          //           left: MySize.size1 * 200,
          //         ),
          //         child: Container(
          //           height: MySize.size20 * 3,
          //           width: MySize.size40 * 8.4,
          //           decoration: BoxDecoration(
          //               gradient: LinearGradient(colors: [list1, list, list]),
          //               borderRadius: BorderRadius.circular(10)),
          //           child: Center(child: Text("Cast", style: listTextStyle)),
          //         ),
          //       )
          //     : const SizedBox(),

          ///////////////////////////

          pauseVal == true
              ? Padding(
                  padding: EdgeInsets.only(
                      top: MySize.size1 * 165, left: MySize.size1 * 550),
                  child: SizedBox(
                    height: MySize.size100 * 1.8,
                    width: MySize.size100 * 3.4,
                    child: Padding(
                        padding: EdgeInsets.only(top: MySize.size4),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [list1, list, list],
                              ),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: MySize.size20, top: MySize.size10),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MySize.size12),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: MySize.size4,
                                                  right: MySize.size4,
                                                  top: MySize.size2,
                                                  bottom: MySize.size12),
                                              child: Text(
                                                widget.data.storyline
                                                    .toString(),
                                                style: boldList,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    })))),
                  ))
              : const SizedBox()
        ],
      )),
    );
  }
}
