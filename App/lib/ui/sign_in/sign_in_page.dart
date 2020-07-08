import 'package:deldrone_customer/custom_widgets/animation/FadeAnimation.dart';
import 'package:deldrone_customer/custom_widgets/background_widget.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/screen_navigation.dart';
import 'package:deldrone_customer/ui/screens/login_screen.dart';
import 'package:deldrone_customer/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Card(
                            color: Colors.grey[100],
                            child: ExpansionTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/63810950.png',
                                    width: 40.0,
                                    height: 40.0,
                                  ),
                                  Center(
                                    child: CustomText(
                                      text: 'Welcome',
                                      size: 35.0,
                                      color: Colors.green[300],
                                      family: 'Circular',
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    text:
                                        'DelDrone is a food app that uses drones to deliver food to your doorstep !',
                                    size: 20.0,
                                    color: Colors.blueGrey,
                                    family: 'Ubuntu',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Verify your identity to get started",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 25,
                                  fontFamily: 'Poppins'),
                            )),
                      ],
                    ),
                    FadeAnimation(
                        1.4,
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/illustration.png'))),
                        )),
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.5,
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () => changeScreenReplacement(
                                  context, LoginScreen()),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: 'Ubuntu'),
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              padding: EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  )),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () => changeScreenReplacement(
                                    context, SignupScreen()),
                                color: Colors.yellow,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily: 'Ubuntu'),
                                ),
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
