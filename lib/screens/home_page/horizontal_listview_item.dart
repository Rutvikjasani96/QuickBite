import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../variables_pro.dart';
import 'variables_home_page.dart';

class HorizontalListviewItem extends StatefulWidget {
  String imageLink, foodName, foodDetail;
  int index;
  // VoidCallback onTap;
  HorizontalListviewItem(
      this.imageLink, this.foodName, this.foodDetail, this.index,
      {super.key});
  // {required this.onTap}

  @override
  State<HorizontalListviewItem> createState() => _HorizontalListviewItemState();
}

class _HorizontalListviewItemState extends State<HorizontalListviewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller1 = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);
  // bool _isFavorite = false;
  final _favorites = Hive.box('favorites');
  final _favoritesImages = Hive.box('favoritesImage');
  final _favoritesName = Hive.box('favoritesName');
  final _favoritesDetails = Hive.box('favoritesDetails');
//   List favoriteListImage = [];
// List favoriteListName = [];
// List favoriteListDetails = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _isFavorite = horizontalFavorites[widget.index];
    if (_favorites.get('favorites') != null) {
      horizontalFavorites = _favorites.get('favorites');
    }
    if (_favoritesImages.get('favoritesImage') != null) {
      favoriteListImage = _favoritesImages.get('favoritesImage');
    }
    if (_favoritesName.get('favoritesName') != null) {
      favoriteListName = _favoritesName.get('favoritesName');
    }
    if (_favoritesDetails.get('favoritesDetails') != null) {
      favoriteListDetails = _favoritesDetails.get('favoritesDetails');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: 185,
      margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("${widget.imageLink}"),
          fit: BoxFit.cover,
        ),
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 8,
            spreadRadius: 1,
            offset: Offset(
              3,
              3,
            ),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black,
              ],
            )),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${widget.foodName}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.foodDetail}",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: font),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      // height: 35,
                      // width: 35,
                      // margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        // child: horizontalFavorites[index] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                        // child: test
                        //     ? Icon(Icons.favorite)
                        //     : Icon(Icons.favorite_border),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // _isFavorite = !_isFavorite;
                              horizontalFavorites[widget.index] =
                                  !horizontalFavorites[widget.index];
                              // _favourite.put('favorite', favList);
                              // _fav.put('fav', fav);
                              if (horizontalFavorites[widget.index]) {
                                favoriteListImage.add(foodImages[widget.index]);
                                favoriteListName.add(foodnames[widget.index]);
                                favoriteListDetails
                                    .add(foodDetails[widget.index]);
                                AnimatedSnackBar.material(
                                  '${foodnames[widget.index]} Added in Liked',
                                  type: AnimatedSnackBarType.success,
                                  mobileSnackBarPosition:
                                      MobileSnackBarPosition.bottom,
                                  desktopSnackBarPosition:
                                      DesktopSnackBarPosition.bottomLeft,
                                  duration: Duration(seconds: 4),
                                ).show(context);
                              } else {
                                favoriteListImage
                                    .remove(foodImages[widget.index]);
                                favoriteListName
                                    .remove(foodnames[widget.index]);
                                favoriteListDetails
                                    .remove(foodDetails[widget.index]);
                                AnimatedSnackBar.material(
                                  '${foodnames[widget.index]} is Unliked',
                                  type: AnimatedSnackBarType.warning,
                                  mobileSnackBarPosition:
                                      MobileSnackBarPosition.bottom,
                                  desktopSnackBarPosition:
                                      DesktopSnackBarPosition.bottomLeft,
                                  duration: Duration(seconds: 4),
                                ).show(context);
                              }
                              _favorites.put('favorites', horizontalFavorites);
                              _favoritesImages.put('favoritesImage', favoriteListImage);
                              _favoritesName.put('favoritesName', favoriteListName);
                              _favoritesDetails.put('favoritesDetails', favoriteListDetails);
                            });
                            _controller1
                                .reverse()
                                .then((value) => _controller1.forward());
                          },
                          child: ScaleTransition(
                            scale: Tween(begin: 0.7, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: _controller1,
                                    curve: Curves.easeOut)),
                            child: horizontalFavorites[widget.index]
                                ? const Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                  ),
                          ),
                        ),
                        // Image.asset("assets/icons/cart.jpg"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// ignore: non_constant_identifier_names
// Widget HorizontalListviewItem(
//     String imageLink, String foodName, String foodDetail, int index,
//     {required VoidCallback onTap}) {
//   return Container(
//     height: 275,
//     width: 185,
//     margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: NetworkImage("${imageLink}"),
//         fit: BoxFit.cover,
//       ),
//       // color: Colors.amber,
//       borderRadius: BorderRadius.circular(8),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey,
//           blurRadius: 8,
//           spreadRadius: 1,
//           offset: Offset(
//             3,
//             3,
//           ),
//         ),
//       ],
//     ),
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.transparent,
//               Colors.transparent,
//               Colors.transparent,
//               Colors.transparent,
//               Colors.black,
//             ],
//           )),
//       child: Column(
//         children: [
//           Spacer(),
//           Row(
//             children: [
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 "${foodName}",
//                 style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontFamily: font,
//                     fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "${foodDetail}",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white,
//                             fontFamily: font),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               Column(
//                 children: [
//                   InkWell(
//                     onTap: onTap,
//                     child: Container(
//                       height: 35,
//                       // width: 35,
//                       // margin: EdgeInsets.only(right: 15),
//                       padding: EdgeInsets.all(5),
//                       margin: EdgeInsets.only(right: 10, bottom: 10),
//                       decoration: BoxDecoration(
//                         color: Colors.white54,
//                         borderRadius: BorderRadius.circular(5),
//                         // boxShadow: [
//                         //   BoxShadow(
//                         //     color: Colors.black38,
//                         //     blurRadius: 8,
//                         //     spreadRadius: 1,
//                         //     offset: Offset(
//                         //       3,
//                         //       3,
//                         //     ),
//                         //   ),
//                         // ],
//                       ),
//                       child: Center(
//                         // child: horizontalFavorites[index] ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
//                         child: test
//                             ? Icon(Icons.favorite)
//                             : Icon(Icons.favorite_border),
//                         // Image.asset("assets/icons/cart.jpg"),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }


