import 'package:flutter/material.dart';
import 'package:foodtek/view/widgets/main_page_widgets/location_notification_srearch.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),

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
