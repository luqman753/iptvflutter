import 'package:flutter/material.dart';

import '../Profile/profile.dart';
import '../searchlist.dart';

Widget myAppBar(context) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SeachList()),
            );
          },
          icon: const Icon(Icons.search)),
      IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          },
          icon: const Icon(Icons.account_circle_outlined))
    ],
  );
}
