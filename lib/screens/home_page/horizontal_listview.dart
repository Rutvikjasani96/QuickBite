import 'package:flutter/material.dart';
import 'package:quickbite/screens/food_details/food_details.dart';
import 'horizontal_listview_item.dart';
import 'variables_home_page.dart';

class HorizontalListview extends StatefulWidget {
  const HorizontalListview({super.key});

  @override
  State<HorizontalListview> createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: foodImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FoodDetails(foodImages[index], foodnames[index],
                            foodDetails[index], foodDesc[index],horizontalPrice[index]),
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
            },
            child: HorizontalListviewItem(
                foodImages[index], foodnames[index], foodDetails[index], index),
          );
        },
      ),
    );
  }
}
