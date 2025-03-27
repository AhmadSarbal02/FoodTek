import 'package:flutter/material.dart';
import '../../../constant/colors.dart';
import '../../../constant/main_screen/main_screen_data.dart';
import '../../widgets/main_page_widgets/tap_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTab = 0;
  final PageController _pageController = PageController();

  void _onTabSelected(int index) {
    setState(() {
      selectedTab = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //so the floatingActionButton stays contestant
      backgroundColor: const Color(0xfff5f5f5),
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(), // the animation of the sliding
        onPageChanged: (index) {
          setState(() => selectedTab = index);
        },
        children: pages,
      ),
      floatingActionButtonLocation: // the middle cart button
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () => _onTabSelected(2),
          shape: const CircleBorder(),
          backgroundColor:
              selectedTab == 2
                  ? AppColors.primaryColor
                  : AppColors.primaryColor,
          child: Image.asset(
            bottomNavImages[2], // Cart icon only
            width: 30,
            height: 30,
            color: selectedTab == 2 ? Colors.grey : Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // surfaceTintColor: Colors.white,
        // shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,

        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                // the button
                title: bottomNavLabels[0],
                icon: bottomNavImages[0],
                onTap: () => _onTabSelected(0),
                isSelected: selectedTab == 0,
              ),
              TabButton(
                title: bottomNavLabels[1],
                icon: bottomNavImages[1],
                onTap: () => _onTabSelected(1),
                isSelected: selectedTab == 1,
              ),
              const SizedBox(width: 40, height: 40),
              // Space for floating button
              TabButton(
                title: bottomNavLabels[3],
                icon: bottomNavImages[3],
                onTap: () => _onTabSelected(3),
                isSelected: selectedTab == 3,
              ),
              TabButton(
                title: bottomNavLabels[4],
                icon: bottomNavImages[4],
                onTap: () => _onTabSelected(4),
                isSelected: selectedTab == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
