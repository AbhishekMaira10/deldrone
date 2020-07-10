import 'package:deldrone_customer/custom_widgets/background_widget.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/restaurant.dart';
import 'package:deldrone_customer/providers/restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return WillPopScope(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundWidget(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CustomText(
                      text: 'All Restaurants',
                      size: 20.0,
                      weight: FontWeight.bold,
                      family: 'Circular',
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Column(
                    children: restaurantProvider.restaurants
                        .map((item) => GestureDetector(
                              onTap: () {},
                              child: RestaurantWidget(
                                restaurant: item,
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onWillPop: () => onBackPressed(context),
    );
  }
}
