import 'package:deldrone_customer/UI/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

//defining entry point of the application
void main() => runApp(MyApp());

//root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DelDrone',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
