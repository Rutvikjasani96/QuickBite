import 'package:flutter/material.dart';

import '../../../variables_pro.dart';
import '../variables_profile.dart';

Widget ProfileDetailsBoxRow(int index) {
  return Column(
    children: [
      Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0, left: 15),
            child: Text(
              "${profileDetailsName[index]}",
              style: TextStyle(
                  fontFamily: font,
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Container(
            width: 190,
            margin: EdgeInsets.only(top: 0, right: 15),
            alignment: Alignment.centerRight,
            child: Text(
              maxLines: 3,
              "${profileDetailsDetail[index]}",
              style: TextStyle(
                fontFamily: font,
                fontSize: 17,
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      profileDetailsName.length - 1 != index
          ? Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey.shade400,
                    margin: EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 10),
                  ),
                ),
              ],
            )
          : Container(),
    ],
  );
}
