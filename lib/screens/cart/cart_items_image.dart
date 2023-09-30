import 'package:flutter/material.dart';
import 'package:quickbite/screens/cart/variables_cart.dart';

import '../../variables_pro.dart';

Widget CartItemsImages(int index) {
  return Column(
    children: [
      Expanded(
        child: Container(
          height: 65,
          width: 65,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "${cartImages[index]}"),
              fit: BoxFit.cover,
            ),
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6,
                spreadRadius: 1,
                offset: Offset(
                  3,
                  3,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
