import 'package:flutter/material.dart';
import 'package:quickbite/screens/profile_page/variables_profile.dart';

import '../../variables_pro.dart';

Widget ProfileNickName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "@${userNickName}",
        style: TextStyle(
            fontFamily: font,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey),
      ),
    ],
  );
}
