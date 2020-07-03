import 'package:flutter/material.dart';

Future<bool> onBackPressed(BuildContext context) {
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
