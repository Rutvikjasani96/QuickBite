import 'package:flutter/material.dart';

import '../../variables_pro.dart';

Widget FoodDeatilsDetails(String foodDetails) {
  return Row(
    children: [
      SizedBox(
        width: 15,
      ),
      Text(
        "${foodDetails}",
        style: TextStyle(
            fontFamily: font, fontSize: 15, color: Colors.grey.shade700),
      )
    ],
  );
}
