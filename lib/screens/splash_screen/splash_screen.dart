import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../variables_pro.dart';
import '../bootom_navigation_bar/bottom_navigaton.dart';
import '../get_started/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getScreen() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                isLoggedIn ? BottomNavigation() : GetStarted(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ));
    });
  }

  final _loginStatus = Hive.box('IsLoggedIn');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_loginStatus.get('IsLoggedIn') != null) {
      isLoggedIn = _loginStatus.get('IsLoggedIn');
    }
    getScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.jpg",
          height: 200,
          width: 200,
        ),
        SizedBox(height: 150,),
        CircularProgressIndicator(),
      ],
    );
  }
}
