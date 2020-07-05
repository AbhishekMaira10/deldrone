import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/bought_food.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/food_category.dart';
import 'package:deldrone_customer/data/food_data.dart';
import 'package:deldrone_customer/ui/Pages/explore_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Opacity(opacity: 0.6, child: Image.asset('assets/images/bg.png')),
              ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                            text: 'What would you like to eat?',
                            size: 18,
                            family: 'Circular',
                            weight: FontWeight.bold),
                      ),
                      Stack(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(Icons.notifications_none),
                              onPressed: () {}),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
                            offset: Offset(1, 1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        title: TextField(
                            decoration: InputDecoration(
                          hintText: 'Find Food and Restraunts',
                          border: InputBorder.none,
                        )),
                        trailing: Icon(
                          Icons.filter_list,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  FoodCategory(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Frequently Bought Foods",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExplorePage()));
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: _foods.map(_buildFoodItems).toList(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onWillPop: () => onBackPressed(context),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: food.imagePath,
          category: food.category,
          discount: food.discount,
          price: food.price,
          ratings: food.ratings,
        ),
      ),
    );
  }
}
