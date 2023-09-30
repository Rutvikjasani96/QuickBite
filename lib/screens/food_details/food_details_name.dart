import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget FoodDetailsName(String foodname) {
  return Row(
    children: [
      SizedBox(
        width: 15,
      ),
      Text(
        "${foodname}",
        style: TextStyle(
            fontFamily: font, fontSize: 30, fontWeight: FontWeight.bold),
      )
    ],
  );
}
