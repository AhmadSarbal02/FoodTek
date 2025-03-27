// main screen data
import 'package:flutter/material.dart';
import '../../view/screen/main_screens/cart/cart_screen.dart';
import '../../view/screen/main_screens/favorites/favorites_screen.dart';
import '../../view/screen/main_screens/history/history_screen.dart';
import '../../view/screen/main_screens/home/home_screen.dart';
import '../../view/screen/main_screens/profile/profile_screen.dart';

final List<String> bottomNavLabels = [
  "Home",
  "Favorites",
  "",
  "History",
  "Profile",
];
final List<String> bottomNavImages = [
  "assets/images/mainPage/home.png",

  "assets/images/mainPage/Favorites.png",
  "assets/images/mainPage/cart.png",
  "assets/images/mainPage/history.png",

  "assets/images/mainPage/profile.png",
];
final List<Widget> pages = [
  const HomeScreen(),
  const FavoritesScreen(),
  const CartScreen(),
  const HistoryScreen(),
  const ProfileScreen(),
];
