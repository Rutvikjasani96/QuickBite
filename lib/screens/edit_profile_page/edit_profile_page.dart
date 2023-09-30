import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import '../../variables_pro.dart';
import '../bootom_navigation_bar/bottom_navigaton.dart';
import '../data_collection/data_details_name.dart';
import '../data_collection/data_error.dart';
import '../data_collection/data_textfield.dart';
import '../profile_page/variables_profile.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

// Many Comman Widget are called from data_collection
class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController nnameController = TextEditingController();
  TextEditingController mnumberController = TextEditingController();
  TextEditingController pcodeController = TextEditingController();

  final _userdetailsdetail = Hive.box('usrDetailsDetail');
  final _address = Hive.box('address');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nnameController.text = userNickName;
    address_controller.text = address;
    mnumberController.text = profileDetailsDetail[1];
    pcodeController.text = profileDetailsDetail[3];
    fnameController.text = profileDetailsDetail[4];
    lnameController.text = profileDetailsDetail[5];
    nnameController.text = profileDetailsDetail[6];
    if (_userdetailsdetail.get('usrDetailsDetail') != null) {
      profileDetailsDetail = _userdetailsdetail.get('usrDetailsDetail');
    }
    if (_address.get('address') != null) {
      address = _address.get('address');
    }
  }

  String alertMsgfname = "";
  String alertMsglname = "";
  String alertMsgnname = "";
  String alertMsgmnumber = "";
  String alertMsgaddress = "";
  String alertMsgpcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // centerTitle: true,
        title: Text(
          // ✨🎈🧨🎉🎀🔥❤️‍🔥💝💖❤️
          "🎀 Edit User Information 🎀",
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
              margin: EdgeInsets.only(right: 35, left: 35, bottom: 15, top: 10),
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
                        'Success',
                        'Data Successfully Edited',
                        type: AnimatedSnackBarType.success,
                        brightness: Brightness.dark,
                      ).show(context);
                      _userdetailsdetail.put(
                          'usrDetailsDetail', profileDetailsDetail);
                      Navigator.pop(context);
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
                    'Save Profile',
                    style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
