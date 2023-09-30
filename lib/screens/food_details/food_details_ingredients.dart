import 'package:flutter/material.dart';

import 'variables_food_details.dart';

Widget FoodDetailsIngredients() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 80,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: Ingredients.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(top: 10, left: 15),
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset("${Ingredients[index]}"));
            },
          ),
        ),
      )
    ],
  );
}
