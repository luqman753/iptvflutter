import 'package:cheiwe_player/Controller/trendingController.dart';
import 'package:cheiwe_player/Trailor/webviewTrailor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Components/appbar.dart';
import '../Components/constant.dart';
import '../size_config.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending>
    with AutomaticKeepAliveClientMixin<Trending> {
  final TrendingController trendingController = Get.put(TrendingController());
  returnfunc() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Navigator.pop(context);
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  List image = [dummy, dummy1, dummy2, dummy3];
  int tap = 0;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return WillPopScope(
      onWillPop: () async {
        return returnfunc();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(MySize.size60),
              child: myAppBar(context)),
          body: Padding(
            padding: EdgeInsets.only(left: MySize.size6, right: MySize.size6),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Genres",
                    style: kNormalTextStyle,
                  ),
                  SizedBox(
                    height: MySize.size10,
                  ),
                  Stack(
                    children: [
                      //////////////////////////////////Curved  Shape line ////////////////////////
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MySize.size30 * 1.6,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              width: 2,
                            ),
                          )),
                      /////////////////////////////// Categories Listview
                      Obx(() {
                        if (trendingController.isLoading.value) {
                          return const CircularProgressIndicator();
                        }
                        return Padding(
                          padding: EdgeInsets.only(
                              left: MySize.size2,
                              right: MySize.size20,
                              top: MySize.size2 * 1.9),
                          child: SizedBox(
                            height: MySize.size30 * 1.3,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: trendingController.genreList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size12),
                                    child: Row(
                                      children: [
                                        tap == index
                                            ? Container(
                                                // width: MySize.size30 * 1.2,
                                                height: MySize.size30 * 1.2,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      linearColor2,
                                                      linearColor1,
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.elliptical(
                                                              101, 97)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    trendingController
                                                        .genreList[index].name
                                                        .toString(),
                                                    style: listTextStyle,
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    tap = index;

                                                    if (trendingController
                                                            .genreList[index]
                                                            .name ==
                                                        "ALL") {
                                                      trendingController
                                                          .filterALL();
                                                    } else {
                                                      trendingController
                                                          .genreFilter(
                                                              trendingController
                                                                  .genreList[
                                                                      index]
                                                                  .id
                                                                  .toString());
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  trendingController
                                                      .genreList[index].name
                                                      .toString(),

                                                  // .value
                                                  // .genreFiler![0]
                                                  // .data![index]
                                                  // .name
                                                  // .toString(),
                                                  style: listTextStyle,
                                                ),
                                              ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: MySize.size10,
                  ),

                  Text(
                    "Series",
                    style: kNormalTextStyle,
                  ),
                  SizedBox(height: MySize.size10),
                  //////////////////////////////////////////////  Series ///////////////////////////////
                  Obx(() {
                    if (trendingController.initiaLoading.isTrue
                        ? trendingController.isLoading.value
                        : trendingController.seriesLoading.value) {
                      return Padding(
                        padding: EdgeInsets.only(left: MySize.size140 * 2),
                        child: const CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      height: MySize.size80 * 1.8,
                      child: ListView.builder(
                          controller: trendingController.seriesController,
                          scrollDirection: Axis.horizontal,
                          itemCount: trendingController.seriesData.length,
                          // trendingController
                          //     .trendingData.value.seriesFilter![0].data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(left: MySize.size12),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TrailorWebView(
                                                      data: trendingController
                                                          .trendingData
                                                          .value
                                                          .seriesFilter![0]
                                                          .data![index])
                                              // Home(
                                              //     data: trendingController
                                              //         .trendingData
                                              //         .value
                                              //         .seriesFilter![0]
                                              //         .data![index])

                                              ),
                                        );
                                      },
                                      child: Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: Image.network(
                                                // trendingController
                                                //     .trendingData
                                                //     .value
                                                //     .seriesFilter![0]
                                                //     .data![index]
                                                //     .image
                                                //     .toString(),
                                                trendingController
                                                    .seriesData[index].image
                                                    .toString()

                                                // ["data"][index]["image"]
                                                )),
                                      )),
                                ],
                              ),
                            );
                          }),
                    );
                  }),

                  SizedBox(height: MySize.size10),
                  Text(
                    "Movies",
                    style: kNormalTextStyle,
                  ),
                  SizedBox(height: MySize.size10),

                  ////////////////////////////////MOVIES/////////////////////////////////////////////
                  Obx(() {
                    if (trendingController.initiaLoading.isTrue
                        ? trendingController.isLoading.value
                        : trendingController.moviesLoading.value) {
                      return const CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: MySize.size80 * 1.8,
                        child: ListView.builder(
                            controller: trendingController.moviesController,
                            scrollDirection: Axis.horizontal,
                            itemCount: trendingController.moviesData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: MySize.size12),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const MyHomePage()),
                                        // );
                                      },
                                      child: Center(
                                        child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: Image.network(
                                                trendingController
                                                    .moviesData[index].image
                                                    .toString())),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                  }),
                  SizedBox(height: MySize.size10),
                  /////////////////////////  History

                  SizedBox(height: MySize.size10),
                  Text(
                    "History",
                    style: kNormalTextStyle,
                  ),
                  SizedBox(height: MySize.size10),
                  //////////////////// History ListView

                  SizedBox(
                    height: MySize.size80 * 1.8,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: image.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: MySize.size12),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const MyHomePage()),
                                    // );
                                  },
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(image[index])),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
