// import 'package:flutter/material.dart';
//
// import '../../../../model/category.dart';
// import '../home/item_details_screen.dart';
//
// class FavoritesScreen extends StatelessWidget {
//   final List<Category> categoryItems;
//   const FavoritesScreen({super.key, required this.categoryItems});
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//
//         padding: EdgeInsets.all(10),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // Adjust grid layout
//           childAspectRatio: 0.8,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: categoryItems.length,
//         itemBuilder: (context, index) {
//
//           final item = categoryItems[index];
//           return InkWell(
//             borderRadius: BorderRadius.circular(15),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder:
//                       (context) => ItemDetailsScreen(
//                     name: categoryItems[index].title,
//                     image: categoryItems[index].image,
//                     price: categoryItems[index].price,
//                     // Example price list
//                     description: categoryItems[index].description,
//                     // Example description list
//                     rating:
//                     categoryItems[index].rating, // Example ratings list
//                   ),
//                 ),
//               );
//             },
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Expanded(child: Image.asset(item.image, fit: BoxFit.cover)),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Text(
//                           item.title,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           item.description,
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                         Text(item.price, style: TextStyle(color: Colors.green)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/constant/colors.dart';
import '../../../../cubit/main_cubit/favorites_cubit.dart';
import '../../../widgets/main_page_widgets/location_notification_srearch.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LocationNotificationSrearch(showSearchBar: true),
          const SizedBox(height: 15),

          Expanded(
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoaded) {
                  if (state.favorites.isEmpty) {
                    return Center(child: Text("No favorites yet!"));
                  }
                  return GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Adjust grid layout
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: state.favorites.length,
                    itemBuilder: (context, index) {
                      final item = state.favorites[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 5,
                                                sigmaY: 5,
                                              ),
                                              // Adds background blur
                                              child: AlertDialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                // Keeps background clear
                                                contentPadding: EdgeInsets.zero,
                                                insetPadding: EdgeInsets.all(
                                                  10,
                                                ),
                                                // Controls overall padding
                                                content: Container(
                                                  padding: EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          15,
                                                        ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'Are you sure you want to remove it from favorites?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(height: 20),
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          context
                                                              .read<
                                                                FavoritesCubit
                                                              >()
                                                              .toggleFavorite(
                                                                item,
                                                              );
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                          ),
                                                          minimumSize: Size(
                                                            double.infinity,
                                                            50,
                                                          ), // Full-width button
                                                        ),
                                                        child: Text(
                                                          "Yes",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Image.asset(
                                  item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.description,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      item.price,
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                ); // Handle other states
              },
            ),
          ),
        ],
      ),
    );
  }
}
