import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../variables_pro.dart';
import '../cart/variables_cart.dart';

class FoodDetailsBottomNavigation extends StatefulWidget {
  String foodImage, foodname, foodDetails;
  int price;
  FoodDetailsBottomNavigation(
      this.foodImage, this.foodname, this.foodDetails, this.price,
      {super.key});

  // FoodDetailsBottomNavigation(this.foodimage,this.foodname,this.fooddetails,this.price, {super.key});

  @override
  State<FoodDetailsBottomNavigation> createState() =>
      _FoodDetailsBottomNavigationState();
}

class _FoodDetailsBottomNavigationState
    extends State<FoodDetailsBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            spreadRadius: 0.5,
            offset: Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(17), topRight: Radius.circular(17)),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                  // color: Colors.blue,
                  margin: EdgeInsets.only(top: 7, left: 15),
                  child: Text(
                    "Price",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )),
              Container(
                // color: Colors.blueGrey,
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "₹ ${widget.price}",
                  style: TextStyle(
                      fontFamily: font,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 150,
                margin: EdgeInsets.only(right: 15),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      if (cartImages.contains(widget.foodImage)) {
                        AnimatedSnackBar.material(
                          'Alreay Added in Cart',
                          type: AnimatedSnackBarType.warning,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.topCenter,
                          duration: Duration(seconds: 4),
                        ).show(context);
                      } else {
                        cartImages.add(widget.foodImage);
                        cartDetails.add(widget.foodDetails);
                        cartName.add(widget.foodname);
                        cartPrice.add(widget.price);
                        AnimatedSnackBar.material(
                          'Added in Cart',
                          type: AnimatedSnackBarType.success,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.topRight,
                          duration: Duration(seconds: 4),
                        ).show(context);
                      }
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                          fontFamily: font,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
