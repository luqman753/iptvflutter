import 'package:cheiwe_player/Components/constant.dart';
import 'package:cheiwe_player/size_config.dart';
import 'package:flutter/material.dart';

class SeachList extends StatefulWidget {
  const SeachList({Key? key}) : super(key: key);

  @override
  State<SeachList> createState() => _SeachListState();
}

class _SeachListState extends State<SeachList> {
  List image = [
    dummy,
    dummy2,
    dummy,
    dummy2,
    dummy,
    dummy2,
    dummy,
    dummy2,
  ];

  bool? submit;
  @override
  void initState() {
    super.initState();
    submit = false;
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MySize.size20 * 2.2, left: MySize.size1 * 0.2),
              child: SizedBox(
                  height: MySize.size60,
                  width: MediaQuery.of(context).size.width * 0.8 * 1,
                  child: TextField(
                    onTap: () {
                      submit = false;
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      submit = true;
                      setState(() {});
                      print(value);
                    },
                    style: TextStyle(
                      color: loginTextColor,
                    ),
                    autofocus: true,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        color: loginTextColor,
                      ),
                      filled: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: search,
                      labelText: 'Drama',
                      // labelText: TextDisplayConstants.EMAIL,
                      labelStyle: TextStyle(
                        color: loginTextColor,
                        fontSize: 14,
                      ),
                    ),
                  )),
            ),
            submit == false
                ? Padding(
                    padding: EdgeInsets.only(
                        left: MySize.size20 * 2.2, top: MySize.size5 * 2),
                    child: Row(
                      children: [
                        SizedBox(
                          height: MySize.size10,
                        ),
                        Text(
                          "Top Searches",
                          style: listTextStyle,
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            submit == false
                ? Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: MySize.size10),
                      child: ListView.builder(
                          itemCount: image.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        image[index],
                                        height: MySize.size160,
                                        // width: MySize.size160,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MySize.size20,
                                        ),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Superstar",
                                              style: TextStyle(
                                                  color: loginTextColor),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: MySize.size10),
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s ",
                                                style: TextStyle(
                                                    color: loginTextColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )

                                    // Expanded(
                                    //   child: Container(
                                    //     color: Colors.white,
                                    //     child: Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       mainAxisAlignment: MainAxisAlignment.start,
                                    //       children: [
                                    //         Text(
                                    //           "Superstar",
                                    //           style: TextStyle(color: loginTextColor),
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                                const Divider(
                                  color: Colors.white,
                                ),
                              ],
                            );
                          }),
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 160,
                                childAspectRatio: 3 / 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemCount: image.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(image[index])));
                        }),
                  ),
          ],
        ));
  }
}
