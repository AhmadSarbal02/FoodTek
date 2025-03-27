// home screen data still needs work
import '../../model/category.dart';
//final List<String> topList = ["All", "Burger", "Pizza", "sandwich"];
final List<String> topListImages = [
  "",
  "assets/images/mainPage/home_page_images/top_list_images/burger.png",
  "assets/images/mainPage/home_page_images/top_list_images/Pizza.png",
  "assets/images/mainPage/home_page_images/top_list_images/sandwich.png",
];

final List<String> topRatedItemsTitles = [
  "Chicken burger",
  "Cheese burger",
  "Chicken burger",
];
final List<String> topRatedItemsDescriptions = [
  "100 gr chicken + tomato + cheese  Lettuce",
  "100 gr meat + onion + tomato + Lettuce cheese",
  "100 gr chicken + tomato + cheese  Lettuce",
];
final List<String> topRatedItemsPrices = ["\$20.00", "\$15.00", "\$20.00"];
final List<String> topRatedItemsImages = [
  "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
  "assets/images/mainPage/home_page_images/top_rated_list_images/img_1.png",
  "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
];
final List<String> recommendedImages = [
  "assets/images/mainPage/home_page_images/recommend_images/curry.png",
  "assets/images/mainPage/home_page_images/recommend_images/img_2.png",
  "assets/images/mainPage/home_page_images/recommend_images/img_3.png",
  "assets/images/mainPage/home_page_images/recommend_images/sushi.png",
];

final List<String> recommendedPrices = [
  "\$103.0",
  "\$50.0",
  "\$12.99",
  "\$8.20",
];


final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];
String selectedCategory = "All";

final List<Category> allItems = [
  Category(
    title: "Chicken Burger",
    image: "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
    description: "100 gr chicken + tomato + cheese + Lettuce",
    price: "\$20.00",
  ),
  Category(
    title: "Cheese Burger",
    image: "assets/images/mainPage/home_page_images/top_rated_list_images/img_1.png",
    description: "100 gr meat + onion + tomato + Lettuce cheese",
    price: "\$15.00",
  ),
  Category(
    title: "Pepperoni Pizza",
    image: "assets/images/mainPage/home_page_images/top_rated_list_images/img.png",
    description: "Classic Italian Pepperoni Pizza",
    price: "\$29.00",
  ),
  Category(
    title: "Cheese Pizza",
    image: "assets/images/mainPage/home_page_images/top_rated_list_images/img_1.png",
    description: "Margarita-style pizza with fresh mozzarella",
    price: "\$23.00",
  ),
];