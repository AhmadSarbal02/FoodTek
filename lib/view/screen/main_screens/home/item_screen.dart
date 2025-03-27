import 'package:flutter/material.dart';
import '../../../../model/category.dart';

class ItemScreen extends StatelessWidget {
  final List<Category> categoryItems;
  //final List filteredItems;

  const ItemScreen({
    super.key,
    required this.categoryItems,
    //required this.filteredItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust grid layout
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categoryItems.length,
        itemBuilder: (context, index) {
          final item = categoryItems[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(child: Image.asset(item.image, fit: BoxFit.cover)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.description,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(item.price, style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
