import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color color;

  SmallButton({this.btnText, this.onPressed, this.borderRadius, this.color});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(borderRadius)),
          padding: EdgeInsets.all(10),
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          )),
      onPressed: onPressed,
    );
  }
}
