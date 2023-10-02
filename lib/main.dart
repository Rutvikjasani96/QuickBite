import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for SystemChrome
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickbite/screens/bootom_navigation_bar/bottom_navigaton.dart';

import 'package:quickbite/screens/get_started/get_started.dart';
import 'package:quickbite/screens/home_page/home_page.dart';
import 'package:quickbite/screens/profile_page/variables_profile.dart';
import 'package:quickbite/screens/splash_screen/splash_screen.dart';
import 'package:quickbite/variables_pro.dart';

import 'adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(XFileAdapter());
  var box = await Hive.openBox('IsLoggedIn');
  var boxfavorites = await Hive.openBox('favorites');
  var boxfavoriteImage = await Hive.openBox('favoritesImage');
  var boxfavoritesName = await Hive.openBox('favoritesName');
  var boxfavoritesDetails = await Hive.openBox('favoritesDetails');
  var boxusrDetailsDetail = await Hive.openBox('usrDetailsDetail');
  var boxusername = await Hive.openBox('username');
  var boxnickname = await Hive.openBox('nickname');
  var boxaddress = await Hive.openBox('address');
  var boxcart = await Hive.openBox('cart');
  var imageHv = await Hive.openBox<XFile>('image');

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _username = Hive.box('username');
  final _nickname = Hive.box('nickname');
  final _address = Hive.box('address');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_username.get('username') != null) {
      userName = _username.get('username');
    }
    if (_nickname.get('nickname') != null) {
      userNickName = _nickname.get('nickname');
    }
    if (_address.get('address') != null) {
      address = _address.get('address');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
