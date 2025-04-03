// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../constant/colors.dart';
// import '../../../widgets/main_page_widgets/location_notification_srearch.dart';
// import '../../../widgets/main_page_widgets/notification_widget.dart';
//
// class FilterScreen extends StatefulWidget {
//   const FilterScreen({super.key});
//
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }
//
// class _FilterScreenState extends State<FilterScreen> {
//   double priceCurrentValue = 0;
//   double discountCurrentValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             // Location & Notification Row
//             LocationNotificationSrearch(showSearchBar: false),
//
//             Text("Filter", style: TextStyle(fontWeight: FontWeight.bold)),
//             Text("Price range", style: TextStyle(color: Colors.grey[500])),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(width: 1),
//                     color: Colors.green[500],
//                   ),
//                   child: Center(child: Text("Min")),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(width: 1),
//                     color: Colors.green[500],
//                   ),
//                   child: Center(child: Text("Max")),
//                 ),
//               ],
//             ),
//             Slider(
//               activeColor: Colors.green,
//               inactiveColor: Colors.grey,
//               value: priceCurrentValue,
//               onChanged: (value) {
//                 setState(() {
//                   priceCurrentValue = value;
//                 });
//               },
//               max: 108,
//               min: 0,
//               divisions: 108,
//               label: priceCurrentValue.toString(),
//             ),
//             Text("Discount", style: TextStyle(color: Colors.grey[500])),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(width: 1),
//                     color: Colors.green[500],
//                   ),
//                   child: Center(child: Text("Min")),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(width: 1),
//                     color: Colors.green[500],
//                   ),
//                   child: Center(child: Text("Max")),
//                 ),
//               ],
//             ),
//
//             Slider(
//               activeColor: Colors.green,
//               inactiveColor: Colors.grey,
//               value: discountCurrentValue,
//               onChanged: (value) {
//                 setState(() {
//                   discountCurrentValue = value;
//                 });
//               },
//               max: 100,
//               min: 0,
//               divisions: 10,
//               label: discountCurrentValue.toString(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../../widgets/main_page_widgets/location_notification_srearch.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // String selectedCategory = "All"; // Default to show all
  // List<Map<String, String>> dishes = [
  //   {"name": "Cheeseburger", "category": "Fast Food"},
  //   {"name": "Chocolate Cake", "category": "Dessert"},
  //   {"name": "Spicy Crab Cakes", "category": "Sea Food"},
  //   {"name": "Miso-Glazed Cod", "category": "Sea Food"},
  //   {"name": "Lobster Thermidor", "category": "Sea Food"},
  //   {"name": "Seafood Paella", "category": "Sea Food"},
  //   {"name": "Tuna Tartare", "category": "Sea Food"},
  //   {"name": "Clam Chowder", "category": "Sea Food"},
  // ];

  // List<Map<String, String>> getFilteredDishes() {
  //   if (selectedCategory == "All") {
  //     return dishes; // Show all dishes
  //   } else {
  //     return dishes
  //         .where((dish) => dish["category"] == selectedCategory)
  //         .toList();
  //   }
  // }
List<String> dishes = [
    "Tuna Tartare",
    "Spicy Crab Cakes",
    "Seafood Paella",
    "Clam Chowder",
    "Miso-Glazed Cod",
    "Lobster Thermidor",
  ];
  double _minPrice = 0;
  double _maxPrice = 100;
  double _discount = 50;
  int _selectedLocation = 0;

  List<String> categories = ["Fast Food", "Sea Food", "Dessert"];
  List<bool> categorySelected = [false, false, false];

  List<String> locationOptions = ["1 KM", "5 KM", "10 KM"];


  List<bool> dishesSelected = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Filter"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationNotificationSrearch(showSearchBar: false),
            Text("Filter", style: TextStyle(fontWeight: FontWeight.bold)),
            // Price Range
            Text("Price range"),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Min"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Max"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${_minPrice.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: Slider(
                    value: _maxPrice,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: "\$${_maxPrice.toStringAsFixed(0)}",
                    onChanged: (value) {
                      setState(() {
                        _maxPrice = value;
                      });
                    },
                  ),
                ),
                Text(
                  "\$${_maxPrice.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Discount
            Text("Discount", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Min"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: "Max"),
                  ),
                ),
              ],
            ),
            Slider(
              value: _discount,
              min: 0,
              max: 100,
              divisions: 10,
              label: "${_discount.toStringAsFixed(0)}%",
              onChanged: (value) {
                setState(() {
                  _discount = value;
                });
              },
            ),

            SizedBox(height: 16),

            // Category Selection
            Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: List.generate(categories.length, (index) {
                return ChoiceChip(
                  label: Text(categories[index]),
                  selected: categorySelected[index],
                  onSelected: (selected) {
                    setState(() {
                      categorySelected[index] = selected;
                    });
                  },
                );
              }),
            ),

            SizedBox(height: 16),

            // Location Selection
            Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
            ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              isSelected: List.generate(
                locationOptions.length,
                (index) => index == _selectedLocation,
              ),
              onPressed: (index) {
                setState(() {
                  _selectedLocation = index;
                });
              },
              children:
                  locationOptions
                      .map(
                        (e) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(e),
                        ),
                      )
                      .toList(),
            ),

            SizedBox(height: 16),

            // Dishes Selection
            Text("Dishes", style: TextStyle(fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 8,
              children: List.generate(dishes.length, (index) {
                return FilterChip(
                  label: Text(dishes[index]),
                  selected: dishesSelected[index],
                  onSelected: (selected) {
                    setState(() {
                      dishesSelected[index] = selected;
                    });
                  },
                );
              }),
            ),

            SizedBox(height: 24),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Apply filter logic here
                },
                child: Text("Apply Filters"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
