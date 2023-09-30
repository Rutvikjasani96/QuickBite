import 'package:flutter/material.dart';
import '../food_details/food_details.dart';
import 'listtile_see_all.dart';
import 'variable_see_all.dart';

class ListviewSeeAll extends StatefulWidget {
  const ListviewSeeAll({super.key});

  @override
  State<ListviewSeeAll> createState() => _ListviewSeeAllState();
}

class _ListviewSeeAllState extends State<ListviewSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: foodListtileSeeAllImages.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            FoodDetails(
                                foodListtileSeeAllImages[index],
                                foodListtileSeeAllnames[index],
                                foodListtileSeeAllDetails[index],
                                foodListtileSeeAllDesc[index],
                                foodListtileSeeAllPrice[index]),
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
                child: ListviewSeeAllItem(
                    foodListtileSeeAllImages[index],
                    foodListtileSeeAllnames[index],
                    foodListtileSeeAllDetails[index]));
          },
        ),
      ),
    );
  }
}
