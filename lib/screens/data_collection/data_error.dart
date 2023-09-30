import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget dataError(String alertMsg) {
  return alertMsg == ""
      ? SizedBox()
      : Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${alertMsg}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontFamily: font,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 15,
            ),
          ],
        );
}
