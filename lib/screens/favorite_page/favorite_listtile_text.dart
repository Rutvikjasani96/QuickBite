import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget FavoriteListtileText(int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${favoriteListName[index]}",
        style: TextStyle(
            fontSize: 23, fontFamily: font, fontWeight: FontWeight.bold),
      ),
      Text(
        "${favoriteListDetails[index]}",
        style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: font),
      ),
    ],
  );
}
