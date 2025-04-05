import 'package:flutter/material.dart';
import 'package:foodtek/view/widgets/cart/empty_cart-widget.dart';
import 'package:foodtek/view/widgets/main_page_widgets/location_notification_srearch.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  bool locationBar = true;
  HistoryScreen({super.key, required this.locationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              locationBar
                  ? LocationNotificationSrearch(showSearchBar: false)
                  : SizedBox(),
              const SizedBox(height: 15),

              EmptyCartwidget(
                title: 'History Empty',
                subtitle: "You don't have order any foods before",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
