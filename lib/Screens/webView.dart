import 'dart:convert';

import 'package:cheiwe_player/helper/pref.dart';
import 'package:cheiwe_player/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/constant.dart';

import '../network.dart';

import 'package:http/http.dart' as http;

// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Home extends StatefulWidget {
  final data;
  const Home({Key? key, this.data}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int seasonValue = 0;
  var seasonTap;
  returnfunc() async {
    var time = await webView!.evaluateJavascript(
        source: '''var vid = document.getElementById("myVideo");
    vid.currentTime;
    ''');
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.setString("time", time.toString());
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Navigator.pop(context);
  }

  bool pauseVal = false;
  var intialValue = 0;
  int start = 0;
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    // var x = widget.data.seasons[seasonValue].episodes.length;
    // print(x);
  }

  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: WillPopScope(
          onWillPop: () async {
            return returnfunc();
          },
          child: Stack(children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                  url: Uri.parse(
                Uri.dataFromString(
                  '<video controls width="100%" height="100%" id="myVideo" style="z-index:0;background:black;position:fixed; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden;" disablepictureinpicture controlsList="nodownload noplaybackrate">  <source src="https://onedrive.live.com/download?cid=E4C57EA8D08FEF76&resid=E4C57EA8D08FEF76%216462&authkey=AAYiVENn-PUf3Z8"/>  </video>      <script>  var vid = document.getElementById("myVideo");   function getCurTime() {  alert( vid.currentTime);  }   function setCurTime() {  vid.currentTime=20;  }    </script>',
                  mimeType: 'text/html',
                ).toString(),
              )),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  supportZoom: false,
                  javaScriptEnabled: true,
                  mediaPlaybackRequiresUserGesture: true,
                ),
              ),
              onWebViewCreated: (InAppWebViewController controller) async {
                webView = controller;
              },
              onLoadStop: (controller, url) async {
                var watchedtime = await getTime();
                var number = double.parse(watchedtime);
                if (watchedtime == null) {
                  var result2 = await controller.evaluateJavascript(source: """
                       vid.currentTime=`$number`;

                    """);
                } else {
                  var result2 = await controller.evaluateJavascript(source: """
                       vid.currentTime=`$number`;

                    """);

                  print(result2);
                }

                // Foo Bar
              },
            ),
            pauseVal == true && intialValue != 0
                ? InkWell(
                    onTap: () {
                      seasonTap = true;
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MySize.size1 * 50,
                        left: MySize.size1 * 536,
                      ),
                      child: Container(
                        height: MySize.size20 * 3,
                        width: MySize.size40 * 8.6,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [list1, list, list]),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                                "Season ${widget.data.seasons[seasonValue].season}",
                                style: listTextStyle)),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
                top: MySize.size40,
                right: MySize.size4,
                child: GestureDetector(
                  onTap: () {
                    if (pauseVal == false) {
                      intialValue = 1;
                      webView!.evaluateJavascript(source: '''
                     var vid = document.getElementById("myVideo");
                      vid.pause();
                      ''');

                      pauseVal = true;
                    } else {
                      webView!.evaluateJavascript(source: '''
                     var vid = document.getElementById("myVideo");
                      vid.play();
                      ''');

                      pauseVal = false;
                    }
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.info_rounded,
                    color: Colors.white,
                  ),
                )),
            pauseVal == true && intialValue != 0
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MySize.size1 * 115, left: MySize.size1 * 535),
                    child: SizedBox(
                      height: MySize.size100 * 2.95,
                      width: MySize.size100 * 3.4,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount:
                              widget.data.seasons[seasonValue].epsiodes.length,
                          // widget.data.seasons[seasonValue].episodes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: MySize.size4),
                              child: Container(
                                  height: MySize.size1 * 94,
                                  // width: MySize.size1 * 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [list1, list, list],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: MySize.size20, top: MySize.size6),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Image.network(
                                                widget.data.seasons[seasonValue]
                                                    .image
                                                    .toString(),
                                                height: MySize.size80,
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: MySize.size10,
                                                  top: MySize.size6),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget
                                                        .data
                                                        .seasons[seasonValue]
                                                        .epsiodes[index]
                                                        .title
                                                        .toString(),
                                                    style: boldList,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          widget
                                                              .data
                                                              .seasons[
                                                                  seasonValue]
                                                              .epsiodes[index]
                                                              .description,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: listTextStyle,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                  )
                : const SizedBox(),
            seasonTap == true
                ? Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MySize.size40, bottom: MySize.size40),
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: widget.data.seasons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: MySize.size30,
                                    ),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            seasonValue = index;
                                            seasonTap = false;
                                            setState(() {});
                                          },
                                          child: Text(
                                            widget.data.seasons[index].name
                                                .toString(),
                                            style: boldList,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: MySize.size10),
                          child: IconButton(
                              onPressed: () {
                                seasonTap = false;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.settings_power_outlined,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ))
                : const SizedBox()
          ]),
        ));
  }
}
