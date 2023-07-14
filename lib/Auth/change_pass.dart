import 'dart:ui';

import 'package:flutter/material.dart';

import '../Components/constant.dart';
import '../size_config.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
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
            // Text Field ChangePassword
            SizedBox(
              // color: loginTextColor,
              width: MediaQuery.of(context).size.width * 1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MySize.size180,
                    ),
                    // Name TextField
                    SizedBox(
                        height: MySize.size80,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
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
                            labelText: 'Previous Password',
                            // labelText: TextDisplayConstants.EMAIL,
                            labelStyle: TextStyle(
                              color: loginTextColor,
                              fontSize: 14,
                            ),
                          ),
                        )),

                    // New Password
                    SizedBox(
                        height: MySize.size80,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
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
                            labelText: 'New Password',
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
                      onTap: () {},
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
                            "Change Password",
                            style:
                                TextStyle(color: loginTextColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MySize.size30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MySize.size30,
                          child: Image.asset(backPic),
                        ),
                        Text(
                          "  Go Back",
                          style: TextStyle(color: loginTextColor),
                        ),
                      ],
                    )
                    //
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
