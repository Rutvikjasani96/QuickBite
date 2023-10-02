import 'package:flutter/material.dart';

Widget ProfileImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          // color: Colors.amber,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () {
            
          },
          child: CircleAvatar(
            backgroundColor: Colors.black87,
            child: Icon(Icons.upload,size: 22,)
          ),
        ),
      ),
    ],
  );
}
