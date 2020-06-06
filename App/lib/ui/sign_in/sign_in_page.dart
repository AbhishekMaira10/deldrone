import 'package:deldrone_customer/custom_widgets/animation/FadeAnimation.dart';
import 'package:deldrone_customer/ui/sign_in/login_page.dart';
import 'package:deldrone_customer/ui/sign_in/signup_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Stack(
            children: <Widget>[
              Opacity(opacity: 0.5, child: Image.asset('assets/images/bg.png')),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50,
                                color: Colors.green[300],
                                fontFamily: 'Circular'),
                          )),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()));
                              },
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
            ],
          ),
        ),
      ),
    );
  }
}
