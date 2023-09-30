import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget FoodDetailsIngredientsText() {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15),
    child: Text(
      "Ingredients",
      style: TextStyle(
          fontSize: 20, fontFamily: font, fontWeight: FontWeight.bold),
    ),
  );
}
