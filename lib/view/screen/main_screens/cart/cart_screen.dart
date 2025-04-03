import 'package:flutter/material.dart';
import 'package:foodtek/model/item.dart';
import 'package:foodtek/view/widgets/cart/cart_item_widget.dart';
import 'package:foodtek/view/widgets/cart/check_out_widget.dart';
import 'package:foodtek/view/widgets/cart/empty_cart-widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreennnState();
}

class _CartScreennnState extends State<CartScreen> {
  double totel = 0;
  // List<Item> item = items;
  @override
  Widget build(BuildContext context) {
    if (items != null) {
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  title: items[index].title,
                  restaurant: items[index].restaurant,
                  price: items[index].price,
                  imagePath: items[index].image,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CheckOutWidget(subtotel: totel),
          ),
        ],
      );
    } else {
      return EmptyCartwidget(
        title: 'Cart Empty',
        subtitle: "You don't have add any foods in cart at this time",
      );
    }
  }
}
