import 'package:flutter/material.dart';

Widget ProfileDivider() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 1,
          color: Colors.grey.shade400,
          margin: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
        ),
      ),
    ],
  );
}
