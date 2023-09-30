import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quickbite/screens/favorite_page/favorite_page.dart';
import 'package:quickbite/screens/get_started/get_started.dart';
import 'package:quickbite/screens/home_page/home_page.dart';
import 'package:quickbite/screens/profile_page/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int selectedBottomNavigationIndex = 0;

class _BottomNavigationState extends State<BottomNavigation> {
  Future<bool> showExitPopup() async {
    return await NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Text("Exit App"),
          content: Text("Do you want to exit an App?"),
          actions: <Widget>[
            TextButton(
                child: Text("No"),
                onPressed: () => Navigator.of(context).pop(false)),
            TextButton(
                child: Text("Yes"),
                onPressed: () => Navigator.of(context).pop(true)),
          ],
        ).show(context) ??
        false; //if showDialouge had returned null, then return false
  }

  List<Widget> tabItems = [
    Center(child: Text("0")),
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4"))
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: selectedBottomNavigationIndex == 0
            ? HomePage()
            : selectedBottomNavigationIndex == 1
                ? FavoritePage()
                : ProfilePage(),
        bottomNavigationBar: Container(
          height: 65,
          child: FlashyTabBar(
            animationCurve: Curves.linear,
            selectedIndex: selectedBottomNavigationIndex,
            iconSize: 25,
            showElevation: false, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              selectedBottomNavigationIndex = index;
            }),
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.favorite),
                title: Text('Favorites'),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
