import 'package:flutter/material.dart';

import '../../variables_pro.dart';
import 'variables_profile.dart';

Widget ProfileName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${userName}",
        style: TextStyle(
            fontFamily: font, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
