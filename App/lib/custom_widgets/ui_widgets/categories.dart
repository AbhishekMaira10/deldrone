import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/models/category.dart';
import 'package:flutter/material.dart';

List<Category> categoriesList = [
  Category(name: "Salad", image: "salad.png"),
  Category(name: "Steak", image: "steak.png"),
  Category(name: "Fast food", image: "sandwich.png"),
  Category(name: "Deserts", image: "ice-cream.png"),
  Category(name: "Seafood", image: "fish.png"),
  Category(name: "Beer", image: "pint.png"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red[50],
                        offset: Offset(4, 6),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/${categoriesList[index].image}',
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CustomText(
                    text: categoriesList[index].name,
                    size: 16,
                    family: 'Circular'),
              ],
            ),
          );
        },
      ),
    );
  }
}
