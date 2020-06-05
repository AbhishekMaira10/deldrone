import 'package:deldrone_customer/services/auth.dart';
import 'package:deldrone_customer/ui/sign_in/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//defining entry point of the application
void main() => runApp(MyApp());

//root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        title: 'DelDrone',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
