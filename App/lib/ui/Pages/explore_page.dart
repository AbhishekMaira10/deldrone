import 'package:flutter/material.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/custom_widgets/buttons/small_button.dart';

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
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    height: 140.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(0, 3),
                              color: Colors.black38),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/pizza.png'),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: 'Name',
                              size: 16.0,
                              weight: FontWeight.bold,
                              family: 'Ubuntu',
                            ),
                            SizedBox(height: 15.0),
                            CustomText(
                              text: 'Description',
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              width: 210.0,
                              height: 50.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  CustomText(
                                    text: 'Rs 150',
                                    size: 16.0,
                                    family: 'Ubuntu',
                                    weight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                  SmallButton(
                                    btnText: 'Buy',
                                    onPressed: () {},
                                    borderRadius: 5.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
