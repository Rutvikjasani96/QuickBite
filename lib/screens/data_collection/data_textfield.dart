import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickbite/variables_pro.dart';

Widget DataTextField(TextEditingController controller,
    List<TextInputFormatter> inputFormatters, TextInputType keyboardType) {
  return Container(
    margin: EdgeInsets.only(left: 15, right: 15, bottom: 12),
    padding: EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      // border: Border.all(),
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
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      controller: controller,
      style: TextStyle(color: Colors.black, fontFamily: font, fontSize: 17),
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  );
}
