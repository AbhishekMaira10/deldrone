import 'package:deldrone_customer/custom_widgets/alerts/platform_alert_dialog.dart';
import 'package:deldrone_customer/custom_widgets/alerts/back_pressed.dart';
import 'package:deldrone_customer/custom_widgets/background_widget.dart';
import 'package:deldrone_customer/custom_widgets/buttons/small_button.dart';
import 'package:deldrone_customer/custom_widgets/custom_list_tile.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/providers/user_provider.dart';
import 'package:deldrone_customer/ui/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool turnOnNotification = false;
  bool turnOnLocation = false;

  Future<void> _signOut(BuildContext context) async {
    try {
      final authProvider = Provider.of<UserProvider>(context);
      await authProvider.signOut();
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

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserProvider>(context);
    return WillPopScope(
      onWillPop: () => onBackPressed(context),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            BackgroundWidget(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 105.0,
                          width: 105.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              image: DecorationImage(
                                image: authProvider.user.photoUrl != null
                                    ? NetworkImage(
                                        '${authProvider.user.photoUrl}')
                                    : AssetImage(
                                        "assets/images/default_pic.png",
                                      ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CustomText(
                              text: authProvider.userModel?.name ??
                                  "Username loading...",
                              size: 20.0,
                              weight: FontWeight.bold,
                              family: 'Circular',
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            CustomText(
                              text: authProvider.userModel?.email ??
                                  "Email loading...",
                              size: 17.0,
                              family: 'Ubuntu',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SmallButton(
                              btnText: 'Logout',
                              onPressed: () => _confirmSignOut(context),
                              borderRadius: 20.0,
                              color: Colors.redAccent,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            ExpansionTile(
                              title: CustomText(
                                text: 'Location',
                              ),
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            CustomListTile(
                              icon: Icons.visibility,
                              text: "Change Password",
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            CustomListTile(
                              icon: Icons.shopping_cart,
                              text: "Shipping",
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            CustomListTile(
                              icon: Icons.payment,
                              text: "Payment",
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "App Notification",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Switch(
                                  value: turnOnNotification,
                                  onChanged: (bool value) {
                                    // print("The value: $value");
                                    setState(() {
                                      turnOnNotification = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Location Tracking",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Switch(
                                  value: turnOnLocation,
                                  onChanged: (bool value) {
                                    // print("The value: $value");
                                    setState(() {
                                      turnOnLocation = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
