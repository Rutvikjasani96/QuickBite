import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget GetStartedButton({required VoidCallback onPressed}) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 50,
          width: 150,
          margin: EdgeInsets.only(right: 35, left: 35, bottom: 15, top: 10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                onPressed();
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                    fontFamily: font,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              )),
        ),
      ),
    ],
  );
}
