// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ui';

import 'package:cheiwe_player/BottomTab/screen1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uiblock/uiblock.dart';

import '../Components/constant.dart';
import '../network.dart';
import '../size_config.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  login() async {
    UIBlock.block(context);

    String? link = "${getCloudUrl()}/auth/login";
    var url = Uri.parse(link);

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "email": emailController.text.toString(),
          "password": passwordController.text.toString()
        },
      ),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      SharedPreferences? prefs = await SharedPreferences.getInstance();
      prefs.setString("token", data["accessToken"]);
      prefs.setString("id", data["user"]["id"]);
      // prefs.setString("role", data["firstName"]+data["lastName"]);

      UIBlock.unblock(context);

      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Screen1()),
        );
      });
    } else {
      UIBlock.unblock(context);
      print("Exception");
      throw Error;
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
          children: [
            // Pic bottom
            Positioned(
                bottom: MySize.size0,
                child: SizedBox(
                    height: MySize.size100,
                    width: MySize.size120,
                    child: Image.asset(bottomPic))),
            //BigRing at mid left
            Positioned(
              top: MySize.size160 * 0.9,
              right: MySize.size180 * 1.6,
              child: Container(
                  width: MySize.size150 * 1,
                  height: MySize.size150 * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        linearColor2,
                        linearColor1,
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(101, 97)),
                  )),
            ),

            // Small ring at mid
            Positioned(
              bottom: MySize.size140 * 3,
              left: MySize.size140 * 1,
              child: Container(
                  width: MySize.size100,
                  height: MySize.size100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        linearColor2,
                        linearColor1,
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(101, 97)),
                  )),
            ),

            // tiny Ring
            Positioned(
              bottom: MySize.size140 * 1.9,
              left: MySize.size140 * 0.1,
              child: Container(
                  width: MySize.size50,
                  height: MySize.size50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        linearColor2,
                        linearColor1,
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(101, 97)),
                  )),
            ),

            //Small ring at mid right
            Positioned(
              bottom: MySize.size140 * 2.3,
              left: MySize.size140 * 2,
              child: Container(
                  width: MySize.size100,
                  height: MySize.size100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        linearColor2,
                        linearColor1,
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(101, 97)),
                  )),
            ),
            // BigRing at Bottom right
            Positioned(
              bottom: MySize.size160 * 0.5,
              left: MySize.size180 * 1.5,
              child: Container(
                  width: MySize.size150 * 1,
                  height: MySize.size150 * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        linearColor2,
                        linearColor1,
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(101, 97)),
                  )),
            ),
            //upper Pic
            Positioned(
                // top: MySize.size0,
                right: MySize.size0,
                child: SizedBox(
                    height: MySize.size120,
                    width: MySize.size120,
                    child: Image.asset(upperPic))),
            // blur Screen
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                ),
              ),
            )),
            // Text Field Name
            SizedBox(
              // color: loginTextColor,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MySize.size180,
                    ),

                    // Phone Number TextField
                    SizedBox(
                        height: MySize.size80,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: emailController,
                          style: TextStyle(
                            color: loginTextColor,
                          ),
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            fillColor: textField,
                            labelText: 'email',
                            // labelText: TextDisplayConstants.EMAIL,
                            labelStyle: TextStyle(
                              color: loginTextColor,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    SizedBox(
                        height: MySize.size80,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          controller: passwordController,
                          style: TextStyle(
                            color: loginTextColor,
                          ),
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            filled: true,
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            fillColor: textField,
                            labelText: 'Password',
                            // labelText: TextDisplayConstants.EMAIL,
                            labelStyle: TextStyle(
                              color: loginTextColor,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MySize.size80,
                    ),
                    // Sign up button
                    InkWell(
                      onTap: () {
                        login();
                      },
                      child: Container(
                        width: MySize.size140 * 2.23,
                        height: MySize.size60,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          gradient: LinearGradient(
                              colors: [linearColor1, linearColor2]),
                        ),
                        child: Center(
                          child: Text(
                            "Login ",
                            style:
                                TextStyle(color: loginTextColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: MySize.size180 * 1.5),
                    //
                    const Text("Create Account?",
                        style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
