import 'package:flutter/material.dart';

import '../../../variables_pro.dart';
import '../variables_profile.dart';
import 'profile_details_box_row.dart';

Widget ProfileDetailsBox() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 275,
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          padding: EdgeInsets.only(bottom: 15,top: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
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
          child: ListView.builder(
            itemCount: profileDetailsName.length,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProfileDetailsBoxRow(index);
            },
          ),
        ),
      ),
    ],
  );
}
