import 'package:flutter/material.dart';

Widget ProfileImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              // "https://media.licdn.com/dms/image/D4D03AQEuA4GJXpNqAg/profile-displayphoto-shrink_400_400/0/1664657264490?e=1697068800&v=beta&t=t1PTxfv0ga5Xk56VVQ8_vDv_CFfZlagOU3ID8LMhPE0"),
              "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh562e7CEH4C9B9roXrjG9YWZ_-6I3cBw57Jd3CDOlhHu1BzhK6T3sYvbVHJLuSfD6woVlgSxTnWMiCCKgQwJZJGYauC1_7oagD7_IRIQCgsecxmgDglpRnjIM-01FfSu4DclPaYhbpHEBpe40mie4Hg6F6Fl_-t4jDF02xgMkQX74mXHQMgwXCsZDZ0zs/s16000/blue-circle-with-man-s-head-circle-with-white-background_745528-3499-removebg-preview.png"),
        ),
      ),
    ],
  );
}
