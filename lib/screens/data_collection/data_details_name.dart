import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget DataDetailsName(String Deatil) {
  return Row(
    children: [
      Container(
          margin: EdgeInsets.only(left: 20, bottom: 3),
          child: Text(
            "${Deatil}",
            style: TextStyle(
                fontSize: 15, fontFamily: font, fontWeight: FontWeight.bold),
          )),
    ],
  );
}
