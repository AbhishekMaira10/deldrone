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
      child: Stack(
        children: <Widget>[
          BackgroundWidget(),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color(0XFF32CD32),
                floating: true,
                snap: true,
                expandedHeight: 80.0,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
                flexibleSpace: FlexibleSpaceBar(
                  title: CustomText(
                    text: "All Restaurants",
                    color: Colors.white,
                    size: 20.0,
                    weight: FontWeight.bold,
                    family: 'Circular',
                  ),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
                  child: Column(
                    children: restaurantProvider.restaurants
                        .map((item) => GestureDetector(
                              onTap: () {},
                              child: RestaurantWidget(
                                restaurant: item,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      onWillPop: () => onBackPressed(context),
    );
  }
}
