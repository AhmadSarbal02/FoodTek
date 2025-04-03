class Item {
  final String title;
  final String image;
  final String restaurant;
  final double price;

  Item({
    required this.title,
    required this.image,
    required this.restaurant,
    required this.price,
  });
}

final List<Item> items = [
  Item(
    title: "Chicken Burger",
    image:
        "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
    restaurant: 'Hot Cool Spot',
    price: 20.00,
  ),
  Item(
    title: "Cheese Burger",
    image:
        "assets/images/mainPage/home_page_images/top_rated_list_images/img_1.png",
    restaurant: 'Burger Factory LTD',
    price: 15.00,
  ),
  Item(
    title: "Pepperoni Pizza",
    image:
        "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
    restaurant: 'Pizza Palace',
    price: 29.00,
  ),
  Item(
    title: "Cheese Pizza",
    image:
        "assets/images/mainPage/home_page_images/top_rated_list_images/img_1.png",
    restaurant: 'Hot Cool Spot',
    price: 23.00,
  ),
];
