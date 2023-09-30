import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget TreadingNowLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(left: 15,top: 10,right: 15),
        child: Text(
          // ✨🎈🧨🎉🎀❤️‍🔥
          "🎀 Trending Now... 🎀",
          style: TextStyle(
              fontSize: 20, fontFamily: font, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}
