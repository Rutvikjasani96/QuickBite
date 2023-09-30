import 'package:flutter/material.dart';

import '../../variables_pro.dart';
import 'favorite_listtile_favorite_button.dart';
import 'favorite_listtile_image.dart';
import 'favorite_listtile_text.dart';

Widget FavoriteListtile(int index) {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 100,
          margin: EdgeInsets.only(left: 15, right: 15,top: 0,bottom: 22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(
                  3,
                  3,
                ),
              ),
            ],
          ),
          child: Row(
            children: [
              FavoriteListtileImage(index),
              FavoriteListtileText(index),
              Spacer(),
              // FavoriteListtileFavoriteButton(index),
              SizedBox(width: 5),
            ],
          ),
        ),
      ),
    ],
  );
}
