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
  // to load the address
  //the current location of teh user
  // String? address;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadAddress();
  // }
  //
  // Future<void> _loadAddress() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     address = prefs.getString('address');
  //   });
  // }

  String? selectedCategory ; // Null means nothing is selected
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // const SizedBox(height: 20),
              // // Location & Notification Row
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 5),
              //       child: IconButton(
              //         onPressed: () {},
              //         icon: Image.asset(
              //           "assets/images/mainPage/location.png",
              //           width: 34,
              //           height: 34,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(height: 20),
              //     InkWell(
              //       onTap: () {},
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Delivering to",
              //               style: TextStyle(
              //                 color: AppColors.onBoardingtextColor,
              //                 fontSize: 11,
              //               ),
              //             ),
              //             const SizedBox(height: 6),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               children: [
              //                 address == null
              //                     ? Text(
              //                       "Current Location",
              //                       style: TextStyle(
              //                         color: AppColors.onBoardingtextColor,
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.w700,
              //                       ),
              //                     )
              //                     : Text(
              //                       '$address',
              //                       overflow: TextOverflow.ellipsis,
              //                       maxLines: 1,
              //                       textAlign: TextAlign.start,
              //                       style: TextStyle(fontSize: 10),
              //                     ),
              //
              //                 const SizedBox(width: 5),
              //                 Image.asset(
              //                   "assets/images/mainPage/dropDownIcon.png",
              //                   width: 18,
              //                   height: 18,
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     const Spacer(),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 5),
              //       child: IconButton(
              //         onPressed: () => openNotificationSheet(context),
              //         icon: Image.asset(
              //           "assets/images/mainPage/img.png",
              //           width: 24,
              //           height: 24,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //
              // const SizedBox(height: 20),
              //
              // // Search Bar
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: RoundTextfield(
              //     hintText: "Search menu, restaurant or etc",
              //     controller: txtSearch,
              //     left: Container(
              //       alignment: Alignment.center,
              //       width: 30,
              //       child: Icon(Icons.search),
              //     ),
              //     right: IconButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => FilterScreen()),
              //         );
              //       },
              //       icon: Image.asset(
              //         'assets/images/mainPage/filterIcon.png',
              //         width: 18,
              //         height: 18,
              //       ),
              //
              //       alignment: Alignment.center,
              //     ),
              //   ),
              // ),
              LocationNotificationSrearch(showSearchBar: true),
              // load the location widget
              const SizedBox(height: 15),

              // Show Tabs Only If a Category is Selected
              if (selectedCategory != null) ...[
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  //padding: EdgeInsets.all(16),
                  child: DefaultTabController(
                    length: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Back Button
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory =
                                    null; // Reset to show main UI
                              });
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.arrow_back, color: Colors.black),
                                // Text("Back", style: TextStyle(color: Colors.black, fontSize: 16)),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          // shows the items
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),

                            children:
                                categories.map((category) {
                                  // List<Category> filteredItems =
                                  //     category
                                  selectedCategory == "All"
                                      ? allItems
                                      : allItems
                                          .where(
                                            (item) =>
                                                item.title.contains(category),
                                          )
                                          .toList();

                                  return ItemScreen(
                                    categoryItems: filteredItems,
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else ...[
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
                                categories[index]; // Set category
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
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
                // Show Main Screen Content
                PromoBanner(), // the PromoBanner
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
                        // call the helper widget for the Top rated items
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
                        // call the helper widget for the Recommended items
                        cObj: '',
                        onTap: () {},
                        image: recommendedImages[index],
                      );
                    },
                  ),
                ),

                // Category Selection
              ],
            ],
          ),
        ),
      ),
    );
  }
}
