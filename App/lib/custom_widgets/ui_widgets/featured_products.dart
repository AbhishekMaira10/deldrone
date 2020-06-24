import 'package:deldrone_customer/models/products.dart';
import 'package:flutter/material.dart';
import '../custom_text.dart';

List<Product> productsList = [
  Product(
    name: 'Cereals',
    price: 70,
    rating: 4.2,
    vendor: 'GoodFoods',
    wishlist: true,
    image: '1.jpg',
  ),
  Product(
    name: 'Tacos',
    price: 150,
    rating: 4.3,
    vendor: 'GoodFoods',
    wishlist: false,
    image: '5.jpg',
  ),
  Product(
    name: 'Chicken Salad',
    price: 155,
    rating: 4.4,
    vendor: 'GoodFoods',
    wishlist: true,
    image: '2.jpg',
  ),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 240,
                width: 200,
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
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/${productsList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productsList[index].name,
                          ),
                        ),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: productsList[index].wishlist
                                  ? Icon(
                                      Icons.favorite,
                                      size: 18,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 18,
                                      color: Colors.red,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: CustomText(
                                  text: productsList[index].rating.toString(),
                                  color: Colors.grey,
                                  size: 14),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.red,
                              size: 16,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: 'Rs ${productsList[index].price}',
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
