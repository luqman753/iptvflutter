import 'package:flutter/material.dart';

import '../Components/constant.dart';
import '../size_config.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            // height: MediaQuery.of(context).size.height,
            child: Image.asset(detailPic, fit: BoxFit.cover)),
        // Figma Flutter Generator Ellipse4Widget - ELLIPSE
        Positioned(
          top: MySize.size60,
          left: MySize.size34,
          child: Container(
            width: MySize.size60,
            height: MySize.size60,
            decoration: BoxDecoration(
              border: Border.all(
                color: white,
                width: 10,
              ),
              gradient: LinearGradient(
                  // begin: Alignment(6.123234262925839e-17, 1),
                  // end: Alignment(-1, 6.123234262925839e-17),
                  colors: [linearColor1, linearColor2]),
              borderRadius: const BorderRadius.all(Radius.elliptical(42, 41)),
            ),
            child: IconButton(
              icon: Center(
                  child: Icon(
                Icons.arrow_back,
                color: white,
              )),
              onPressed: () {},
            ),
          ),
        )
      ],
    ));
  }
}
