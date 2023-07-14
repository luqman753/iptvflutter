import 'package:flutter/material.dart';

import '../Components/appbar.dart';
import '../Components/constant.dart';
import '../size_config.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List image = [dummy, dummy1, dummy2, dummy3];
  List data = [
    " All ",
    "Action",
    "Drama",
    "Sci-Fi",
    "Comedies",
    "Horror",
    "Thriller",
    "Romance",
    "Anime",
    "Mysterious",
    "Teen",
    "Kids",
    "Reality"
  ];
  int tap = 0;
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
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
                    //////////////////////////////////Curved  Shape line
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
                    ///////////////////////////////Listview
                    Padding(
                      padding: EdgeInsets.only(
                          left: MySize.size2,
                          right: MySize.size20,
                          top: MySize.size2 * 1.9),
                      child: SizedBox(
                        height: MySize.size30 * 1.3,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(left: MySize.size12),
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
                                              borderRadius: const BorderRadius
                                                      .all(
                                                  Radius.elliptical(101, 97)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                data[index],
                                                style: listTextStyle,
                                              ),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              setState(() {
                                                tap = index;
                                              });
                                            },
                                            child: Text(
                                              data[index],
                                              style: listTextStyle,
                                            ),
                                          ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: MySize.size10,
                ),

                Text(
                  "New Releases",
                  style: kNormalTextStyle,
                ),
                SizedBox(height: MySize.size10),
                //////////////////////////////////////////////  New Releases ListView
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
                              Center(
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(image[index])),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: MySize.size10),
                Text(
                  "Continue Watching",
                  style: kNormalTextStyle,
                ),
                SizedBox(height: MySize.size10),
                ///////////////////////////////////////////// Continue Watching LisView

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
                              Center(
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(image[index])),
                              ),
                            ],
                          ),
                        );
                      }),
                ),

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
                              Center(
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: Image.asset(image[index])),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
