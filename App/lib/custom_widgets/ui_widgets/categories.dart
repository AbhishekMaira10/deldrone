import 'package:deldrone_customer/custom_widgets/custom_text.dart';
import 'package:deldrone_customer/models/category_model.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.red[50],
                            offset: Offset(4, 6),
                            blurRadius: 20),
                      ]),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Image.asset(
                            "images/${categoriesList[index].image}",
                            width: 50),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: categoriesList[index].name,
                    size: 14,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}
