import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickbite/screens/favorite_page/favorite_listtile.dart';
import 'package:quickbite/variables_pro.dart';
import '../home_page/variables_home_page.dart';
import 'favorites_title_bar.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _favorites = Hive.box('favorites');
  final _favoritesImages = Hive.box('favoritesImage');
  final _favoritesName = Hive.box('favoritesName');
  final _favoritesDetails = Hive.box('favoritesDetails');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 40,
        ),
        FavoritesTitleBar(),
        favoriteListImage.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                  itemCount: favoriteListImage.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FavoriteListtile(index);
                  },
                ),
              )
            : Expanded(
                child: Center(
                child: Text(
                  "No Favorites Found!",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: font,
                      fontWeight: FontWeight.bold),
                ),
              ))
      ]),
    );
  }
}
