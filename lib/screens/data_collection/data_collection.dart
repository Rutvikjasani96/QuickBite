import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quickbite/screens/bootom_navigation_bar/bottom_navigaton.dart';
import 'package:quickbite/variables_pro.dart';

import '../profile_page/variables_profile.dart';
import 'data_bar.dart';
import 'data_details_name.dart';
import 'data_error.dart';
import 'data_textfield.dart';

class DataCollection extends StatefulWidget {
  // bool status;
  // DataCollection(this.status);

  @override
  State<DataCollection> createState() => _DataCollectionState();
}

class _DataCollectionState extends State<DataCollection> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController nnameController = TextEditingController();
  TextEditingController mnumberController = TextEditingController();
  TextEditingController pcodeController = TextEditingController();

  String alertMsgfname = "";
  String alertMsglname = "";
  String alertMsgnname = "";
  String alertMsgmnumber = "";
  String alertMsgaddress = "";
  String alertMsgpcode = "";

  final _loginStatus = Hive.box('IsLoggedIn');
  final _userdetailsdetail = Hive.box('usrDetailsDetail');
  final _username = Hive.box('username');
  final _nickname = Hive.box('nickname');
  final _address = Hive.box('address');

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_loginStatus.get('IsLoggedIn') != null) {
      isLoggedIn = _loginStatus.get('IsLoggedIn');
    }
    if (_userdetailsdetail.get('usrDetailsDetail') != null) {
      profileDetailsDetail = _userdetailsdetail.get('usrDetailsDetail');
    }
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
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            // ✨🎈🧨🎉🎀🔥❤️‍🔥💝💖❤️
            "🎀 User Information 🎀",
            style: TextStyle(
                fontSize: 20,
                fontFamily: font,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DataDetailsName("First Name"),
            DataTextField(
              fnameController,
              [
                FilteringTextInputFormatter.deny(" "),
                FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\]')),
              ],
              TextInputType.name,
            ),
            dataError(alertMsgfname),
            DataDetailsName("Last Name"),
            DataTextField(
              lnameController,
              [
                FilteringTextInputFormatter.deny(" "),
                FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\]')),
              ],
              TextInputType.name,
            ),
            dataError(alertMsglname),
            DataDetailsName("Nick Name"),
            DataTextField(
              nnameController,
              [
                FilteringTextInputFormatter.deny(" "),
                FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*()+{}\[\]:;<>,.?~\\]')),
              ],
              TextInputType.name,
            ),
            dataError(alertMsgnname),
            DataDetailsName("Mobile Number"),
            DataTextField(
              mnumberController,
              [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              TextInputType.number,
            ),
            dataError(alertMsgmnumber),
            DataDetailsName("Address"),
            DataTextField(
              address_controller,
              [
                FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*()_+{}\[\]:;<>.?~\\]')),
              ],
              TextInputType.text,
            ),
            dataError(alertMsgaddress),
            DataDetailsName("Postal  Code"),
            DataTextField(
              pcodeController,
              [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              TextInputType.number,
            ),
            dataError(alertMsgpcode),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: 150,
                margin:
                    EdgeInsets.only(right: 35, left: 35, bottom: 15, top: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      userName =
                          fnameController.text + ' ' + lnameController.text;
                      userNickName = nnameController.text;
                      address = address_controller.text;
                      profileDetailsDetail[1] = mnumberController.text;
                      profileDetailsDetail[3] = pcodeController.text;
                      profileDetailsDetail[4] = fnameController.text;
                      profileDetailsDetail[5] = lnameController.text;
                      profileDetailsDetail[6] = nnameController.text;
                      if (fnameController.text != "" &&
                          lnameController.text != "" &&
                          userName != "" &&
                          userNickName != "" &&
                          address != "" &&
                          profileDetailsDetail[1].length == 10 &&
                          profileDetailsDetail[3].length == 6 &&
                          address != "") {
                        AnimatedSnackBar.rectangle(
                          'Successful',
                          'Data Successfully Added',
                          type: AnimatedSnackBarType.success,
                          brightness: Brightness.dark,
                        ).show(context);
                        isLoggedIn = true;
                        _loginStatus.put('IsLoggedIn', isLoggedIn);
                        _userdetailsdetail.put(
                            'usrDetailsDetail', profileDetailsDetail);
                        _username.put('username', userName);
                        _nickname.put('nickname', userNickName);
                        _address.put('address', address);
                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      BottomNavigation(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                      } else {
                        if (fnameController.text == "") {
                          alertMsgfname = "Fill the First Name";
                        } else {
                          alertMsgfname = "";
                        }
                        if (lnameController.text == "") {
                          alertMsglname = "Fill the Last Name";
                        } else {
                          alertMsglname = "";
                        }
                        if (userNickName == "") {
                          alertMsgnname = "Fill the Nick Name";
                        } else {
                          alertMsgnname = "";
                        }
                        if (profileDetailsDetail[1] == "") {
                          alertMsgmnumber = "Fill the Mobile Number";
                        } else if (profileDetailsDetail[1].length != 10) {
                          alertMsgmnumber = "Invalid Mobile Number";
                        } else {
                          alertMsgmnumber = "";
                        }
                        if (address == "") {
                          alertMsgaddress = "Fill the Address";
                        } else {
                          alertMsgaddress = "";
                        }
                        if (profileDetailsDetail[3] == "") {
                          alertMsgpcode = "Fill the Postal Code";
                        } else if (profileDetailsDetail[3].length != 6) {
                          alertMsgpcode = "Invalid Postal Code";
                        } else {
                          alertMsgpcode = "";
                        }
                        setState(() {});
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
