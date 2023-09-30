import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:quickbite/screens/bootom_navigation_bar/bottom_navigaton.dart';
import 'package:quickbite/screens/cart/cart.dart';
import 'package:quickbite/screens/get_started/get_started.dart';
import 'package:quickbite/screens/home_page/horizontal_listview.dart';
import 'package:quickbite/screens/home_page/middle_line.dart';
import '../../variables_pro.dart';
import '../home_see_all_page/see_all.dart';
import 'app_bar.dart';
import 'food_listview.dart';
import 'treading_now_line.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          App_Bar(onTapCart: () {
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
          }),
          
          TreadingNowLine(),
          HorizontalListview(),
          MiddelLine(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SeeAll(),
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
          FoodListview(),
        ],
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
