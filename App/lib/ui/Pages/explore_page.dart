import 'package:flutter/material.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
                child: Opacity(
                    opacity: 0.6, child: Image.asset('assets/images/bg.png'))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
              child: Column(
                children: <Widget>[
                  CustomText(
                    text: 'All Food Items',
                    size: 20.0,
                    weight: FontWeight.bold,
                    family: 'Circular',
                  ),
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
