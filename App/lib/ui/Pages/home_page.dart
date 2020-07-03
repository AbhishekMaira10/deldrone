import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/categories.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/featured_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  Categories(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                        text: "Featured", size: 20, color: Colors.grey),
                  ),
                  Featured(),
                ],
              ),
            ],
          ),
        ),
      ),
      onWillPop: () => onBackPressed(context),
    );
  }
}
