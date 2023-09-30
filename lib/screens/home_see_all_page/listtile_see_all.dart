import 'package:flutter/material.dart';

import '../../variables_pro.dart';

// ignore: non_constant_identifier_names
Widget ListviewSeeAllItem(String foodImage,String foodname,String foodsubtitle) {
  return ListTile(
    leading: Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(foodImage),
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
    title: Text(foodname,style: TextStyle(fontFamily: font,fontSize: 17,fontWeight: FontWeight.w500),),
    subtitle: Text(foodsubtitle,style: TextStyle(fontFamily: font),),
    trailing: Icon(
      Icons.arrow_forward_ios_outlined,
      size: 18,
    ),
  );
}
