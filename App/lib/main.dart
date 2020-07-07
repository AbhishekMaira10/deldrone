import 'package:deldrone_customer/providers/auth.dart';
import 'package:deldrone_customer/ui/screens/main_screen.dart';
import 'package:deldrone_customer/ui/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//defining entry point of the application
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider.initialize())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ScreensController())));
}

//root widget
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Unauthenticated:
      case Status.Authenticating:
        return SignInPage();
      case Status.Authenticated:
        return MainScreen();
      default:
        return auth.status == Status.Unauthenticated
            ? SignInPage()
            : MainScreen();
    }
  }
}
