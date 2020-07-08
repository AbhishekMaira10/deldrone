import 'package:deldrone_customer/custom_widgets/buttons/custom_raised_button.dart';
import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/custom_widgets/ui_widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          text: 'Your Food Cart',
          color: Colors.black,
          family: 'Circular',
          weight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 40.0,
                ),
                Positioned(
                  right: 4,
                  bottom: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: CustomText(
                          text: "3",
                          color: Colors.black,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/bg.png',
                width: MediaQuery.of(context).size.width * 2,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fitWidth,
              )),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.vertical,
            children: <Widget>[
              OrderCard(
                  name: 'Grilled Chicken',
                  price: 150.0,
                  image: 'assets/images/lunch.jpeg'),
              OrderCard(
                  name: 'Chicken Burger',
                  price: 85.0,
                  image: 'assets/images/chicken-burger.jpg'),
              OrderCard(
                  name: 'Veg Wrap',
                  price: 65.0,
                  image: 'assets/images/veg_Wrap.jpg'),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildTotalContainer(),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      color: Colors.grey[100],
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                  text: 'Subtotal',
                  size: 18.0,
                  color: Color(0xFF9BA7C6),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
              CustomText(
                  text: 'Rs 300',
                  size: 16.0,
                  color: Color(0xFF6C6D6D),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                  text: 'Discount',
                  size: 18.0,
                  color: Color(0xFF9BA7C6),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
              CustomText(
                  text: 'Rs 30',
                  size: 16.0,
                  color: Color(0xFF6C6D6D),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                  text: 'Cart Total',
                  size: 18.0,
                  color: Color(0xFF9BA7C6),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
              CustomText(
                  text: 'Rs 270',
                  size: 16.0,
                  color: Color(0xFF6C6D6D),
                  family: 'Ubuntu',
                  weight: FontWeight.bold),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomRaisedButton(
            borderRadius: 35,
            childs: Center(
              child: Text(
                "Proceed To Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {},
            color: Colors.blue,
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
