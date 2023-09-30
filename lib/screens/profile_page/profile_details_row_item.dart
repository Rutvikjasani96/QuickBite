import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget ProfileDetailsRowItem(String text1, String text2) {
  return Column(
    children: [
      Text(
        "${text1}",
        style: TextStyle(
            fontFamily: font, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      Text(
        "${text2}",
        style: TextStyle(
            fontFamily: font,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey),
      ),
    ],
  );
}
