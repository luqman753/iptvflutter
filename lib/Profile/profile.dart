import 'package:cheiwe_player/Components/constant.dart';
import 'package:cheiwe_player/size_config.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Profile",
          style: kNormalTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MySize.size1 * 60),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(profile),
              SizedBox(
                height: MySize.size20,
              ),
              Text(
                "Mariyam",
                style: kNormalTextStyle,
              ),
              SizedBox(
                height: MySize.size40,
              ),
              Container(
                height: MySize.size80,
                width: MySize.size1 * 320,
                decoration: BoxDecoration(
                    color:
                        // Colors.amber
                        blackShade),
                child: Padding(
                  padding: EdgeInsets.only(left: MySize.size14),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MySize.size20,
                      ),
                      Text(
                        "Settings",
                        style: listTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                height: MySize.size80,
                width: MySize.size1 * 320,
                decoration: BoxDecoration(
                    color:
                        // Colors.amber
                        blackShade),
                child: Padding(
                  padding: EdgeInsets.only(left: MySize.size14),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MySize.size20,
                      ),
                      Text(
                        "list",
                        style: listTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                height: MySize.size80,
                width: MySize.size1 * 320,
                decoration: BoxDecoration(
                    color:
                        // Colors.amber
                        blackShade),
                child: Padding(
                  padding: EdgeInsets.only(left: MySize.size14),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MySize.size20,
                      ),
                      Text(
                        "Account",
                        style: listTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MySize.size100),
              Text(
                "Logout",
                style: listTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
