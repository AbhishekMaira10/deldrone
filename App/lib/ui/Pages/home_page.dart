import 'package:deldrone_customer/custom_widgets/background_widget.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/bought_food.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/categories.dart';
import 'package:deldrone_customer/data/food_data.dart';
import 'package:deldrone_customer/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: ShowCaseWidget(
          builder: Builder(builder: (context) => Home()),
        ),
      ),
      onWillPop: () => onBackPressed(context),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _frequentlyKey = GlobalKey();
  GlobalKey _cartIndicatorKey = GlobalKey();
  GlobalKey _searchKey = GlobalKey();
  GlobalKey _categoriesKey = GlobalKey();
  BuildContext myContext;

  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    SharedPreferences preferences;

    displayShowcase() async {
      preferences = await SharedPreferences.getInstance();
      bool showcaseVisibilityStatus = preferences.getBool("showShowcase");

      if (showcaseVisibilityStatus == null) {
        preferences.setBool("showShowcase", false);
        return true;
      }
      return false;
    }

    displayShowcase().then((status) {
      if (status) {
        ShowCaseWidget.of(context).startShowCase(
            [_cartIndicatorKey, _searchKey, _categoriesKey, _frequentlyKey]);
      }
    });

    return Stack(
      children: <Widget>[
        BackgroundWidget(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0XFF32CD32),
              pinned: true,
              floating: true,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                title: CustomText(
                  text: "DelDrone",
                  color: Colors.white,
                  size: 22.0,
                  weight: FontWeight.bold,
                  family: 'Circular',
                ),
                centerTitle: true,
              ),
              actions: <Widget>[
                Showcase(
                  key: _cartIndicatorKey,
                  description: "Click here to review your cart",
                  descTextStyle:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  overlayColor: Colors.blueGrey[50],
                  showcaseBackgroundColor: Colors.blueAccent,
                  shapeBorder: CircleBorder(),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Showcase(
                      key: _searchKey,
                      description: "Type your query in here",
                      descTextStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      overlayColor: Colors.blueGrey[100],
                      showcaseBackgroundColor: Colors.redAccent,
                      shapeBorder: CircleBorder(),
                      child: searchBar()),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomText(
                        text: 'What would you like to eat?',
                        size: 18,
                        family: 'Circular',
                        weight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Showcase(
                    key: _categoriesKey,
                    description: "Choose from a variety of categories",
                    descTextStyle:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    overlayColor: Colors.blueGrey[100],
                    showcaseBackgroundColor: Colors.yellowAccent,
                    shapeBorder: CircleBorder(),
                    child: Container(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryProvider.categories.length,
                          itemBuilder: (context, index) {
                            return CategoryWidget(
                                category: categoryProvider.categories[index]);
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Showcase(
                      key: _frequentlyKey,
                      descTextStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                      overlayColor: Colors.blueGrey[200],
                      showcaseBackgroundColor: Colors.greenAccent,
                      shapeBorder: CircleBorder(),
                      description: "See the most loved food items",
                      child: CustomText(
                        text: "Frequently Bought Foods",
                        size: 18.0,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: _foods.map(_buildFoodItems).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(14.0),
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
      ),
    );
  }
}

Widget searchBar() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0XFF32CD32),
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          offset: Offset(1, 1),
          blurRadius: 4,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.red,
          ),
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Find Food and Restraunts',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
          trailing: Icon(
            Icons.filter_list,
            color: Colors.red,
          ),
        ),
      ),
    ),
  );
}
