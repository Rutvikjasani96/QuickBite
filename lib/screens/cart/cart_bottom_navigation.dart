import 'package:flutter/material.dart';
import 'package:quickbite/screens/cart/cart.dart';
import 'package:status_alert/status_alert.dart';

import '../../variables_pro.dart';
import '../cart/variables_cart.dart';

class CartBottomNavigation extends StatefulWidget {
  const CartBottomNavigation({super.key});

  @override
  State<CartBottomNavigation> createState() => _CartBottomNavigationState();
}

class _CartBottomNavigationState extends State<CartBottomNavigation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalPrice = 0;
    for (int i = 0; i < cartPrice.length; i++) {
      totalPrice = totalPrice + cartPrice[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                    "₹ ${totalPrice}",
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
                        Navigator.pop(context);
                        StatusAlert.show(
                          context,
                          duration: Duration(seconds: 1),
                          title: 'Order Placed',
                          subtitle: 'Dummy Order Placed',
                          configuration: IconConfiguration(icon: Icons.done),
                          maxWidth: 260,
                          backgroundColor: Colors.white70,
                        );
                      },
                      child: Text(
                        "Place Order",
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
      ),
    );
  }
}
