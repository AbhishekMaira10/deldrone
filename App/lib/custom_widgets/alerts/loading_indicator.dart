import 'package:flutter/material.dart';

class ShowLoadingIndicator extends StatelessWidget {
  final String message;

  const ShowLoadingIndicator({Key key, @required this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 10.0,
          ),
          Text("$message"),
        ],
      ),
    );
  }
}
