import 'package:flutter/material.dart';
import 'package:quickbite/screens/cart/variables_cart.dart';

import '../../variables_pro.dart';

Widget CartItemsText(int index) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "${cartName[index]}",
        style: TextStyle(
            fontSize: 23, fontFamily: font, fontWeight: FontWeight.bold),
      ),
      Text(
        "${cartDetails[index]}",
        style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: font),
      ),
      Text(
        " ₹ ${cartPrice[index]}",
        style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: font),
      ),
    ],
  );
}
