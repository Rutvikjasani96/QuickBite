import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';
import 'package:quickbite/screens/data_collection/data_collection.dart';
import '../../variables_pro.dart';
import '../bootom_navigation_bar/bottom_navigaton.dart';
import 'address_textfield.dart';
import 'get_started_button.dart';
import 'textfield_error_msg.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String textfieldErrorMsg = "";
  Future<bool> showExitPopup() async {
    return await NDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          title: Text("Exit App"),
          content: Text("Do you want to exit an App?"),
          actions: <Widget>[
            TextButton(
                child: Text("No"), onPressed: () => Navigator.of(context).pop(false)),
            TextButton(
                child: Text("Yes"), onPressed: () => Navigator.of(context).pop(true)),
          ],
        ).show(context)
        ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  child: Image.asset(
                "assets/images/map.jpg",
                fit: BoxFit.cover,
              )),
              AddressTextfield(address_controller),
              textfieldErrorMsg == ""
                  ? SizedBox()
                  : TextFieldErrorMsg(textfieldErrorMsg),
              GetStartedButton(onPressed: () {
                address = address_controller.text;
                if (address != "") {
                  AnimatedSnackBar.rectangle(
                    'Successful',
                    'Address Added',
                    type: AnimatedSnackBarType.success,
                    brightness: Brightness.dark,
                  ).show(context);
                  Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DataCollection(),
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
                } else {
                  textfieldErrorMsg = "Fill the Address";
                }
                setState(() {});
              }),
            ],
          ),
        ),
      ),
    );
  }
}
