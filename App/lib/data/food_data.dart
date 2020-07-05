class Food {
  final String id;
  final String name;
  final String imagePath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

  Food(
      {this.id,
      this.name,
      this.imagePath,
      this.category,
      this.price,
      this.discount,
      this.ratings});
}

final foods = [
  Food(
    id: "1",
    name: "Tomato Cheese Pizza",
    imagePath: "assets/images/pizza.png",
    category: "Pizza",
    price: 90.0,
    discount: 10.0,
    ratings: 55.0,
  ),
  Food(
    id: "2",
    name: "Grilled Chicken Salad",
    imagePath: "assets/images/lunch.jpeg",
    category: "Salad",
    price: 110.0,
    discount: 0.0,
    ratings: 80.0,
  ),
];
