import 'package:cheiwe_player/Auth/signup.dart';
// import 'package:cheiwe_player/BottomTab/screen1.dart';
// import 'package:cheiwe_player/Components/constant.dart';
// import 'package:cheiwe_player/Screens/webView.dart';
// import 'package:cheiwe_player/constants.dart';
// import 'package:cheiwe_player/size_config.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'dart:math' as math;
import 'package:flutter/material.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();

void main() {
  runApp(const MyApp());
}
// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

// Than we setup preferred orientations,
// and only after it finished we run our app
// SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
//     .then((value) => runApp(const MyApp()));
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SignUp(),
        theme: ThemeData(
          backgroundColor: Colors.black,

          // primarySwatch: customSwatch,
        ));
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List image = [DetailList, DetailList, DetailList];
//   // GlobalKey _betterPlayerKey = GlobalKey();
//   late BetterPlayerController _betterPlayerController;
//   bool val = false;

//   @override
//   void initState() {
//     WidgetsFlutterBinding.ensureInitialized();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//     ]);
//     // _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);
//     BetterPlayerConfiguration betterPlayerConfiguration =
//         const BetterPlayerConfiguration(
//       autoPlay: true,
//       expandToFill: true,
//       placeholderOnTop: true,
//       // fullScreenByDefault: true,
//       deviceOrientationsAfterFullScreen: [
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight
//       ],

//       fit: BoxFit.cover,
//     );

//     BetterPlayerDataSource dataSource = BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,

//       Uri.dataFromString(
//         '<video controls width="360" height="240" id="myVideo">  <source src="https://onedrive.live.com/download?cid=E4C57EA8D08FEF76&resid=E4C57EA8D08FEF76%216462&authkey=AAYiVENn-PUf3Z8"/>  </video>   <button onclick="getCurTime()" type="button">Get current time position</button>  <button onclick="setCurTime()" type="button">Set time position to 5 seconds</button>   <script>  var vid = document.getElementById("myVideo");   function getCurTime() {  alert(vid.currentTime);  }   function setCurTime() {  vid.currentTime=20;  }    </script>',
//         mimeType: 'text/html',
//       ).toString(),
//       // "https://onedrive.live.com/download?cid=E4C57EA8D08FEF76&resid=E4C57EA8D08FEF76%216462&authkey=AAYiVENn-PUf3Z8"
//       // Uri.dataFromString(
//       //         '<iframe  src="https://onedrive.live.com/embed?cid=E4C57EA8D08FEF76&resid=E4C57EA8D08FEF76%216620&authkey=ANdRZflkVdN3Wac" width=100% height=100%  allowfullscreen=0 frameborder="0" style="background:black;position:fixed; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999999;"></iframe>',
//       //         mimeType: 'text/html')
//       //     .toString(),
//     );

//     _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
//     _betterPlayerController.setBetterPlayerControlsConfiguration(
//       const BetterPlayerControlsConfiguration(
//         enableFullscreen: false,
//       ),
//     );
// // _betterPlayerController.
//     _betterPlayerController.setupDataSource(dataSource);
//     _betterPlayerController.setOverriddenAspectRatio(1.0);
//     // _betterPlayerController.exitFullScreen();
//     _betterPlayerController.videoPlayerController!.addListener(() {
//       checkVideo();
//     });
//     _betterPlayerController.addEventsListener((event) {
//       print("Better player event: ${event.parameters}");
//     });
//     super.initState();
//   }

//   int pak = 0;
//   checkVideo() {
//     if (_betterPlayerController.videoPlayerController!.value.isPlaying !=
//         true) {
//       pak = 1;
//       setState(() {});
//     } else {
//       pak = 0;
//       setState(() {});
//     }
//   }

//   returnfunc() {
//     SystemChrome.setPreferredOrientations(
//         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//     return Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);
//     return Scaffold(
//       body: WillPopScope(
//         onWillPop: () async {
//           return returnfunc();
//         },
//         child: Stack(
//           children: [
//             SizedBox(child: BetterPlayer(controller: _betterPlayerController)),
//             // AspectRatio(
//             //   aspectRatio: 16 / 9,

//             //   // MySize.size1 * 12.01 / MySize.size6,
//             //   child: ,
//             // ),

//             //2nd
//             // pak == 1
//             //     ? Padding(
//             //         padding: EdgeInsets.only(
//             //           top: MySize.size0,
//             //           left: MySize.size80 * 8,
//             //           // right: MySize.size80 * 1.6
//             //         ),
//             //         child: SizedBox(
//             //             width: MySize.size30 * 10,
//             //             height: MySize.size30 * 10,
//             //             child: Transform.rotate(
//             //               angle: -89.99045821467507 * (math.pi / 180),
//             //               child: Image.asset(picture),
//             //             )),
//             //       )
//             //     : SizedBox(),

//             pak == 1
//                 ? Padding(
//                     padding: EdgeInsets.only(
//                       top: MySize.size1 * 50,
//                       left: MySize.size1 * 550,
//                     ),
//                     child: Container(
//                       height: MySize.size20 * 3,
//                       width: MySize.size40 * 8.6,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(colors: [list1, list, list]),
//                           borderRadius: BorderRadius.circular(10)),
//                       child:
//                           Center(child: Text("Season 1", style: listTextStyle)),
//                     ),
//                   )
//                 : const SizedBox(),

//             pak == 1
//                 ? Padding(
//                     padding: EdgeInsets.only(
//                         top: MySize.size1 * 80, left: MySize.size1 * 548),
//                     child: SizedBox(
//                       height: MySize.size100 * 4,
//                       width: MySize.size100 * 3.4,
//                       child: Padding(
//                         padding: EdgeInsets.only(top: MySize.size6),
//                         child: ListView.builder(
//                             scrollDirection: Axis.vertical,
//                             itemCount: 3,
//                             // image.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(top: MySize.size4),
//                                 child: Container(
//                                     height: MySize.size1 * 94,
//                                     width: MySize.size1 * 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       gradient: LinearGradient(
//                                         colors: [list, list],
//                                       ),
//                                     ),
//                                     child: Padding(
//                                       padding: EdgeInsets.only(
//                                           left: MySize.size20,
//                                           top: MySize.size6),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Transform.rotate(
//                                                 angle: -89.99045821467507 *
//                                                     (math.pi / 180),
//                                                 child: Image.asset(
//                                                   dummyDetail,
//                                                   height: MySize.size80,
//                                                 ),
//                                               ),
//                                               Expanded(
//                                                   child: Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: MySize.size20,
//                                                     top: MySize.size5),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text(
//                                                       "Episode #1",
//                                                       style: listTextStyle,
//                                                     ),
//                                                     Text(
//                                                       "Lorem Ipsum is simply dummy text.",
//                                                       style: listTextStyle,
//                                                     )
//                                                   ],
//                                                 ),
//                                               ))
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                               );
//                             }),
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),

//             // loading Adds
//             //pak==1?
//             // ? Padding(
//             //     padding: EdgeInsets.only(
//             //         top: MySize.size80 * 2,
//             //         left: MySize.size80 * 1.6,
//             //         right: MySize.size80 * 1.6),
//             //     child: SizedBox(
//             //       height: MySize.size80 * 1.8,
//             //       child: ListView.builder(
//             //           scrollDirection: Axis.horizontal,
//             //           itemCount: image.length,
//             //           itemBuilder: (BuildContext context, int index) {
//             //             return Padding(
//             //               padding: EdgeInsets.only(left: MySize.size12),
//             //               child: Row(
//             //                 children: [
//             //                   Center(
//             //                     child: ClipRRect(
//             //                         borderRadius: const BorderRadius.all(
//             //                             Radius.circular(10)),
//             //                         child: Image.asset(image[index])),
//             //                   ),
//             //                 ],
//             //               ),
//             //             );
//             //           }),
//             //     ),
//             //   )
//             //More Like This
//             // pak == 1
//             // ? Positioned(
//             //     top: MySize.size40 * 2.8,
//             //     left: MySize.size40 * 2,
//             //     child: const SizedBox(
//             //         child: Text(
//             //       "More like this",
//             //       style: TextStyle(color: Colors.white, fontSize: 20),
//             //     )))
//             // : const SizedBox(),
//             pak == 1
//                 ? Positioned(
//                     top: MySize.size42,
//                     left: MySize.size10,
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //       builder: (context) => const Screen1()),
//                         // );
//                         SystemChrome.setPreferredOrientations([
//                           DeviceOrientation.portraitUp,
//                           DeviceOrientation.portraitDown
//                         ]);
//                       },
//                       child: Container(
//                         width: MySize.size60,
//                         height: MySize.size60,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: const Color.fromRGBO(255, 255, 255, 1),
//                             width: 10,
//                           ),
//                           gradient: const LinearGradient(
//                               begin: Alignment(6.123234262925839e-17, 1),
//                               end: Alignment(-1, 6.123234262925839e-17),
//                               colors: [
//                                 Color.fromRGBO(75, 141, 238, 1),
//                                 Color.fromRGBO(84, 19, 173, 1)
//                               ]),
//                           borderRadius:
//                               const BorderRadius.all(Radius.elliptical(42, 41)),
//                         ),
//                         child:
//                             const Icon(Icons.arrow_back, color: Colors.white),
//                       ),
//                     ))
//                 : const SizedBox()
//           ],
//         ),
//       ),
//     );
//   }
// }
