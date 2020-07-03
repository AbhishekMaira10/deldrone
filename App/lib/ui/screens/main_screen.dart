import 'package:flutter/material.dart';

//Pages
import 'package:deldrone_customer/ui/Pages/home_page.dart';
import 'package:deldrone_customer/ui/Pages/explore_page.dart';
import 'package:deldrone_customer/ui/Pages/order_page.dart';
import 'package:deldrone_customer/ui/Pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  Widget currentPage;

  HomePage homePage;
  OrderPage orderPage;
  ExplorePage explorePage;
  ProfilePage profilePage;

  List<Widget> pages;

  @override
  void initState() {
    homePage = HomePage();
    orderPage = OrderPage();
    explorePage = ExplorePage();
    profilePage = ProfilePage();
    pages = [homePage, explorePage, orderPage, profilePage];

    currentPage = homePage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text("Explore"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Orders"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
