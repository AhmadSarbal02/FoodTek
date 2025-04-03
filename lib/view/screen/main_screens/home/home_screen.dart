import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../constant/main_screen/home_screen_data.dart';
import '../../../../model/category.dart';
import '../../../widgets/main_page_widgets/category_cell.dart';
import '../../../widgets/main_page_widgets/location_notification_srearch.dart';
import '../../../widgets/main_page_widgets/promo_banner.dart';
import '../../../widgets/main_page_widgets/view_all_title.dart';
import 'item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory; // Null means nothing is selected
  TextEditingController txtSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Category> filteredItems = // to filter the items
        selectedCategory == null || selectedCategory == "All"
            ? allItems
            : allItems
                .where((item) => item.title.contains(selectedCategory!))
                .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              LocationNotificationSrearch(showSearchBar: true),
              const SizedBox(height: 15),

              // Always show category list
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory =
                              categories[index] == "All"
                                  ? null
                                  : categories[index];
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color:
                              selectedCategory == categories[index] ||
                                      (categories[index] == "All" &&
                                          selectedCategory == null)
                                  ? Colors.orange[200] // Highlight selected
                                  : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Show main screen if All is selected
              if (selectedCategory == null) ...[
                PromoBanner(), // Promo banner
                const SizedBox(height: 20),

                // Top Rated
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ViewAllTitleRow(title: "Top Rated", onView: () {}),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedItemsTitles.length,
                    itemBuilder: (context, index) {
                      return CategoryCell(
                        cObj: topRatedItemsTitles[index],
                        image: topRatedItemsImages[index],
                        onTap: () {},
                      );
                    },
                  ),
                ),

                // Recommended
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ViewAllTitleRow(title: "Recommended", onView: () {}),
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedImages.length,
                    itemBuilder: (context, index) {
                      return CategoryCell(
                        cObj: '',
                        onTap: () {},
                        image: recommendedImages[index],
                      );
                    },
                  ),
                ),
              ] else ...[
                // Show filtered category items using Flexible
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: EdgeInsets.all(16),
                  child: Flexible(
                    child: ItemScreen(
                      categoryItems:
                          allItems
                              .where(
                                (item) =>
                                    item.title.contains(selectedCategory!),
                              )
                              .toList(),
                    ),
                  ),
                ),
              ],
            ],
          ),

          // Column(
          //   children: [
          //     LocationNotificationSrearch(showSearchBar: true),
          //     // load the location widget
          //     const SizedBox(height: 15),
          //
          //     // Show Tabs Only If a Category is Selected
          //     if (selectedCategory != null) ...[
          //       Container(
          //         height: MediaQuery.of(context).size.height * 0.85,
          //         //padding: EdgeInsets.all(16),
          //         child: DefaultTabController(
          //           length: 1,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               // Back Button
          //               Align(
          //                 alignment: Alignment.centerLeft,
          //                 child: TextButton(
          //                   onPressed: () {
          //                     setState(() {
          //                       selectedCategory =
          //                           null; // Reset to show main UI
          //                     });
          //                   },
          //                   child: Row(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Icon(Icons.arrow_back, color: Colors.black),
          //                       // Text("Back", style: TextStyle(color: Colors.black, fontSize: 16)),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //
          //               Expanded(
          //                 // shows the items
          //                 child: TabBarView(
          //                   physics: NeverScrollableScrollPhysics(),
          //
          //                   children:
          //                       categories.map((category) {
          //                         // List<Category> filteredItems =
          //                         //     category
          //                         selectedCategory == "All"
          //                             ? allItems
          //                             : allItems
          //                                 .where(
          //                                   (item) =>
          //                                       item.title.contains(category),
          //                                 )
          //                                 .toList();
          //
          //                         return ItemScreen(
          //                           categoryItems: filteredItems,
          //                         );
          //                       }).toList(),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ] else ...[
          //       SizedBox(
          //         height: 50,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: categories.length,
          //           itemBuilder: (context, index) {
          //             return GestureDetector(
          //               onTap: () {
          //                 setState(() {
          //                   if (categories[index] == "All") {
          //                     selectedCategory = null; // Reset to main screen
          //                   } else {
          //                     selectedCategory =
          //                         categories[index]; // Show selected category
          //                   }
          //                 });
          //               },
          //               child: Container(
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: 10,
          //                   vertical: 5,
          //                 ),
          //                 margin: EdgeInsets.symmetric(horizontal: 5),
          //                 decoration: BoxDecoration(
          //                   color: Colors.grey[200],
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 child: Center(
          //                   child: Text(
          //                     categories[index],
          //                     style: TextStyle(color: Colors.black),
          //                   ),
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //       const SizedBox(height: 20),
          //       // Show Main Screen Content
          //       PromoBanner(), // the PromoBanner
          //       const SizedBox(height: 20),
          //
          //       // Top Rated
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: ViewAllTitleRow(title: "Top Rated", onView: () {}),
          //       ),
          //       SizedBox(
          //         height: 120,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: topRatedItemsTitles.length,
          //           itemBuilder: (context, index) {
          //             return CategoryCell(
          //               // call the helper widget for the Top rated items
          //               cObj: topRatedItemsTitles[index],
          //               image: topRatedItemsImages[index],
          //               onTap: () {},
          //             );
          //           },
          //         ),
          //       ),
          //       // Recommended
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: ViewAllTitleRow(title: "Recommended", onView: () {}),
          //       ),
          //       SizedBox(
          //         height: 120,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: recommendedImages.length,
          //           itemBuilder: (context, index) {
          //             return CategoryCell(
          //               // call the helper widget for the Recommended items
          //               cObj: '',
          //               onTap: () {},
          //               image: recommendedImages[index],
          //             );
          //           },
          //         ),
          //       ),
          //
          //       // Category Selection
          //     ],
          //   ],
          // ),
        ),
      ),
    );
  }
}
