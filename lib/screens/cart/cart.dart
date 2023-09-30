import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quickbite/screens/cart/variables_cart.dart';
import 'package:quickbite/variables_pro.dart';
import 'cart_bottom_navigation.dart';
import 'cart_items_image.dart';
import 'cart_items_text.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0.0,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black, fontFamily: font),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (cartImages.isNotEmpty &&
                    cartDetails.isNotEmpty &&
                    cartName.isNotEmpty &&
                    cartPrice.isNotEmpty) {
                  cartImages = [];
                  cartDetails = [];
                  cartName = [];
                  cartPrice = [];
                  AnimatedSnackBar.material(
                    'All Items are Removed',
                    type: AnimatedSnackBarType.error,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                    duration: Duration(seconds: 4),
                  ).show(context);
                }
                else{
                  AnimatedSnackBar.material(
                          'Cart is Empty',
                          type: AnimatedSnackBarType.error,
                          mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                          desktopSnackBarPosition:
                              DesktopSnackBarPosition.topCenter,
                          duration: Duration(seconds: 4),
                        ).show(context);
                }
                setState(() {});
              },
              icon: Icon(
                Icons.delete_sweep,
                size: 30,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), topRight: Radius.circular(35))),
        child: cartImages.length != 0
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartImages.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              CartItemsImages(index),
                              CartItemsText(index),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  AnimatedSnackBar.material(
                                    '${cartName[index]} Removed',
                                    type: AnimatedSnackBarType.error,
                                    mobileSnackBarPosition:
                                        MobileSnackBarPosition.bottom,
                                    desktopSnackBarPosition:
                                        DesktopSnackBarPosition.topCenter,
                                    duration: Duration(seconds: 4),
                                  ).show(context);
                                  cartImages.remove(cartImages[index]);
                                  cartDetails.remove(cartDetails[index]);
                                  cartName.remove(cartName[index]);
                                  cartPrice.remove(cartPrice[index]);
                                  totalPrice = 0;
                                  for (int i = 0; i < cartPrice.length; i++) {
                                    totalPrice = totalPrice + cartPrice[i];
                                  }
                                  setState(() {});
                                },
                                icon: Icon(Icons.delete, size: 25),
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Center(
                              child: Lottie.asset("assets/lotties/empty.json",
                                  height: 250, width: 250, fit: BoxFit.fill))),
                    ],
                  ),
                ],
              ),
        // CartItems(),
      ),
      bottomNavigationBar:
          cartImages.length != 0 ? CartBottomNavigation() : SizedBox(),
    );
  }
}
