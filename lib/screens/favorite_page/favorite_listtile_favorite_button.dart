// import 'package:flutter/material.dart';

// import '../../variables_pro.dart';
// import '../home_page/variables_home_page.dart';

// class FavoriteListtileFavoriteButton extends StatefulWidget {
//   int index;
//   FavoriteListtileFavoriteButton(this.index);

//   @override
//   State<FavoriteListtileFavoriteButton> createState() =>
//       _FavoriteListtileFavoriteButtonState();
// }

// class _FavoriteListtileFavoriteButtonState
//     extends State<FavoriteListtileFavoriteButton>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller1 = AnimationController(
//       duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);
//   // bool _isFavorite = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // _isFavorite = horizontalFavorites[widget.index];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           height: 43,
//           width: 43,
//           // margin: EdgeInsets.only(right: 15),
//           padding: EdgeInsets.all(5),
//           margin: EdgeInsets.only(right: 10, bottom: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(50),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black38,
//                 blurRadius: 8,
//                 spreadRadius: 1,
//                 offset: Offset(
//                   3,
//                   3,
//                 ),
//               ),
//             ],
//           ),
//           child: GestureDetector(
//             onTap: () {
//               setState(() {
//                 // _isFavorite = !_isFavorite;
//                 horizontalFavorites[widget.index] =
//                     !horizontalFavorites[widget.index];
//                 // horizontalFavorites[widget.index] = _isFavorite;
//                 // _favourite.put('favorite', favList);
//                 // _fav.put('fav', fav);
//                 if (horizontalFavorites[widget.index]) {
//                   //_isFavorite
//                   favoriteListImage.add(foodImages[widget.index]);
//                   favoriteListName.add(foodnames[widget.index]);
//                   favoriteListDetails.add(foodDetails[widget.index]);
//                 } else {
//                   favoriteListImage.remove(foodImages[widget.index]);
//                   favoriteListName.remove(foodnames[widget.index]);
//                   favoriteListDetails.remove(foodDetails[widget.index]);
//                 }
//               });
//               _controller1.reverse().then((value) => _controller1.forward());
//             },
//             child: ScaleTransition(
//               scale: Tween(begin: 0.7, end: 1.0).animate(
//                   CurvedAnimation(parent: _controller1, curve: Curves.easeOut)),
//               child: horizontalFavorites[widget.index]
//                   ? const Icon(
//                       Icons.favorite,
//                       size: 30,
//                       color: Colors.red,
//                     )
//                   : const Icon(
//                       Icons.favorite_border,
//                       size: 30,
//                     ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // Widget FavoriteListtileFavoriteButton() {
// //   return Column(
//     // mainAxisAlignment: MainAxisAlignment.center,
// //     children: [
// //       Container(
// //         height: 43,
// //         width: 43,
// //         // margin: EdgeInsets.only(right: 15),
// //         padding: EdgeInsets.all(5),
// //         margin: EdgeInsets.only(right: 10, bottom: 10),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(50),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black38,
// //               blurRadius: 8,
// //               spreadRadius: 1,
// //               offset: Offset(
// //                 3,
// //                 3,
// //               ),
// //             ),
// //           ],
// //         ),
// //         child: Center(
// //           child: Icon(Icons.favorite_border),
// //           // Image.asset("assets/icons/cart.jpg"),
// //         ),
// //       ),
// //     ],
// //   );
// // }
