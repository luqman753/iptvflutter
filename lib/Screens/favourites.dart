import 'package:flutter/material.dart';

import '../Components/appbar.dart';
import '../Components/constant.dart';
import '../size_config.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List image = [dummy, dummy1, dummy2, dummy3];
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
