import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget TextFieldErrorMsg(String textfieldErrorMsg) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        "${textfieldErrorMsg}",
        style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontFamily: font,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 15,
      ),
    ],
  );
}
