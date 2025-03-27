import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../constant/colors.dart';
import '../../../widgets/main_page_widgets/location_notification_srearch.dart';
import '../../../widgets/main_page_widgets/notification_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double priceCurrentValue = 0;
  double discountCurrentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Location & Notification Row
            LocationNotificationSrearch(showSearchBar: false),

            Text("Filter", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Price range", style: TextStyle(color: Colors.grey[500])),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                    color: Colors.green[500],
                  ),
                  child: Center(child: Text("Min")),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                    color: Colors.green[500],
                  ),
                  child: Center(child: Text("Max")),
                ),
              ],
            ),
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              value: priceCurrentValue,
              onChanged: (value) {
                setState(() {
                  priceCurrentValue = value;
                });
              },
              max: 108,
              min: 0,
              divisions: 108,
              label: priceCurrentValue.toString(),
            ),
            Text("Discount", style: TextStyle(color: Colors.grey[500])),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                    color: Colors.green[500],
                  ),
                  child: Center(child: Text("Min")),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1),
                    color: Colors.green[500],
                  ),
                  child: Center(child: Text("Max")),
                ),
              ],
            ),
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              value: discountCurrentValue,
              onChanged: (value) {
                setState(() {
                  discountCurrentValue = value;
                });
              },
              max: 100,
              min: 0,
              divisions: 10,
              label: discountCurrentValue.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
