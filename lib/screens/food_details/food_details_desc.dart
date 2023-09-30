import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quickbite/variables_pro.dart';

Widget FoodDetailsDesc(String foodDesc) {
  return Container(
    margin: EdgeInsets.all(15),
    child: Text(
      foodDesc,
      style: TextStyle(
          fontFamily: font, fontWeight: FontWeight.w500, fontSize: 16,color: Colors.grey.shade600),
    ),
  );
}
