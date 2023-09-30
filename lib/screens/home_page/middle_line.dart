import 'package:flutter/material.dart';
import '../../variables_pro.dart';

Widget MiddelLine({required VoidCallback onPressed}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Text(
            "✨ People are looking ✨",
            style: TextStyle(
                fontSize: 20, fontFamily: font, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          "See all",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontFamily: font),
        ),
      )
    ],
  );
}
