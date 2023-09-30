import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickbite/screens/data_collection/data_collection.dart';
import 'package:quickbite/variables_pro.dart';

import '../bootom_navigation_bar/bottom_navigaton.dart';
import '../cart/cart.dart';
import '../edit_profile_page/edit_profile_page.dart';
import 'profile_details_box/profile_details_box.dart';
import 'profile_details_row.dart';
import 'profile_divider.dart';
import 'profile_image.dart';
import 'profile_name.dart';
import 'profile_nick_name.dart';
import 'profile_title_bar.dart';
import 'variables_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _userdetailsdetail = Hive.box('usrDetailsDetail');
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_userdetailsdetail.get('usrDetailsDetail') != null) {
      profileDetailsDetail = _userdetailsdetail.get('usrDetailsDetail');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileTitleBar(),
          SizedBox(
            height: 10,
          ),
          ProfileImage(),
          SizedBox(
            height: 10,
          ),
          ProfileName(),
          ProfileNickName(),
          ProfileDivider(),
          ProfileDetailsRow(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Cart(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
            },
          ),
          ProfileDivider(),
          ProfileDetailsBox(),
          Container(
            height: 50,
            margin: EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            EditProfilePage(),
                        // DataCollection(false),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ));
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
