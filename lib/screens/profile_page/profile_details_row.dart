import 'package:flutter/material.dart';
import 'package:quickbite/screens/cart/variables_cart.dart';

import '../../variables_pro.dart';
import 'profile_details_row_item.dart';

Widget ProfileDetailsRow({required VoidCallback onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ProfileDetailsRowItem("${favoriteListImage.length}","Favorites"),
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onTap, child: ProfileDetailsRowItem("${cartImages.length}","Cart")),
    ],
  );
}
