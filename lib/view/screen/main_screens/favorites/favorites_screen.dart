import 'package:flutter/material.dart';
import 'package:foodtek/view/widgets/main_page_widgets/location_notification_srearch.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              LocationNotificationSrearch(showSearchBar: true),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
