import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  final String name;
  final String image;
  final double price;

  const OrderCard({Key key, this.name, this.image, this.price})
      : super(key: key);
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 90.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.indigo[200],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              offset: Offset(1, 1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    widget.price.toString(),
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
