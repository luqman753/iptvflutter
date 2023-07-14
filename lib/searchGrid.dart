import 'package:cheiwe_player/Components/constant.dart';
import 'package:cheiwe_player/size_config.dart';
import 'package:flutter/material.dart';

class SearchGrid extends StatefulWidget {
  const SearchGrid({Key? key}) : super(key: key);

  @override
  State<SearchGrid> createState() => _SearchGridState();
}

class _SearchGridState extends State<SearchGrid> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MySize.size20 * 2.2, left: MySize.size20 * 2),
              child: SizedBox(
                  height: MySize.size60,
                  width: MediaQuery.of(context).size.width * 0.8 * 1,
                  child: TextField(
                    style: TextStyle(
                      color: loginTextColor,
                    ),
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.number,
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
         
         
          ],
        ));
  }
}
