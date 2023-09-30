import 'package:flutter/material.dart';
import '../../variables_pro.dart';
import '../food_details/food_details.dart';
import '../home_see_all_page/variable_see_all.dart';
import 'food_listtile.dart';
import 'variables_home_page.dart';

class FoodListview extends StatefulWidget {
  const FoodListview({super.key});

  @override
  State<FoodListview> createState() => _FoodListviewState();
}

class _FoodListviewState extends State<FoodListview> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: homePageListcount,
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
              child: FoodListtile(
                  foodListtileSeeAllImages[index],
                  foodListtileSeeAllnames[index],
                  foodListtileSeeAllDetails[index]));
        },
      ),
    );
  }
}
