import 'package:flutter/material.dart';
import 'package:quickbite/screens/food_details/food_details_details.dart';
import 'package:quickbite/screens/food_details/food_details_name.dart';
import 'food_details_bottom_navigation.dart';
import 'food_details_desc.dart';
import 'food_details_ingredients.dart';
import 'food_details_ingredients_text.dart';

class FoodDetails extends StatefulWidget {
  String foodImage, foodname, foodDetails, foodDesc;
  int price;
  FoodDetails(this.foodImage, this.foodname, this.foodDetails, this.foodDesc,this.price);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Image.network(
            widget.foodImage,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 15,
          ),
          FoodDetailsName(widget.foodname),
          FoodDeatilsDetails(widget.foodDetails),
          FoodDetailsDesc(widget.foodDesc),
          FoodDetailsIngredientsText(),
          FoodDetailsIngredients(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
      bottomNavigationBar: FoodDetailsBottomNavigation(widget.foodImage, widget.foodname, widget.foodDetails,widget.price),
    );
  }
}
