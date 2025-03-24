import 'package:flutter/material.dart';
import 'package:foodtek/view/screen/main_screens/profile/profile_screen.dart';
import 'package:foodtek/view/screen/onBoarding_screen.dart';

import 'cart/cart_screen.dart';
import 'favorites/favorites_screen.dart';
import 'history/history_screen.dart';
import 'home/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Keep background consistent
        elevation: 10,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() => selectedIndex = index);
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite, color: Colors.green),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: selectedIndex == 2 ? Colors.green : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: selectedIndex == 2 ? Colors.white : Colors.black54,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history_toggle_off),
            activeIcon: Icon(Icons.history, color: Colors.green),
            label: 'History',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.green),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => selectedIndex = index);
        },
        children: const [
          HomeScreen(),
          FavoritesScreen(),
          CartScreen(),
          HistoryScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
