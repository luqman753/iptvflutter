import 'dart:convert';

import 'package:flutter/material.dart';

import '../Components/constant.dart';
import '../Screens/favourites.dart';
import '../Screens/movies.dart';
import '../Screens/trending.dart';
import '../Screens/tv.dart';
import '../helper/pref.dart';
import '../network.dart';
import '../size_config.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List pages = [
    const Trending(),
    const Movies(),
    const TV(),
    const Favourite()
  ];

  getData() async {
    String? link = "${getCloudUrl()}/series?column=id";
    var url = Uri.parse(link);
    String? token = await getToken();

    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      print("Exception");
      throw Error;
    }
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          height: MySize.size60,
          width: MediaQuery.of(context).size.width * 1,
          child: Padding(
            padding: const EdgeInsets.only(
                // left: MySize.size13, right: MySize.size13
                ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  currentIndex == 0
                      ? SizedBox(
                          width: MySize.size90 * 1.1,
                          // height: MySize.size100,
                          child: Image.asset(firstTab))
                      : InkWell(
                          onTap: () {
                            onTap(0);
                          },
                          child: SizedBox(
                              width: MySize.size90 * 1.001,
                              child: Image.asset(firstPic))),
                  // SizedBox(
                  //   height: MySize.size10,
                  // ),
                  currentIndex == 1
                      ? SizedBox(
                          width: MySize.size90 * 1.1,
                          child: Image.asset(secondTab))
                      : InkWell(
                          onTap: () {
                            onTap(1);
                          },
                          child: SizedBox(
                              width: MySize.size90 * 1.001,
                              child: Image.asset(secondPic))),
                  // SizedBox(
                  //   height: MySize.size10,
                  // ),
                  currentIndex == 2
                      ? SizedBox(
                          width: MySize.size90 * 1.1,
                          child: Image.asset(thirdTab))
                      : InkWell(
                          onTap: () {
                            onTap(2);
                          },
                          child: SizedBox(
                              width: MySize.size90 * 1.001,
                              child: Image.asset(thirdPic))),
                  // SizedBox(
                  //   height: MySize.size10,
                  // ),
                  currentIndex == 3
                      ? SizedBox(
                          width: MySize.size90 * 1.1,
                          child: Image.asset(fourthTab))
                      : InkWell(
                          onTap: () {
                            onTap(3);
                          },
                          child: SizedBox(
                              width: MySize.size90 * 1.001,
                              child: Image.asset(fourthPic))),
                ]),
          ),
        ));
  }
}
