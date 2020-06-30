import 'package:deldrone_customer/custom_widgets/alerts/platform_alert_dialog.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/categories.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/featured_products.dart';
import 'package:deldrone_customer/services/auth.dart';
import 'package:deldrone_customer/ui/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you really want to exit?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Yes"),
                )
              ],
            ));
  }

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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => _confirmSignOut,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
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
      onWillPop: () => _onBackPressed(context),
    );
  }
}
