import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  // name constructor that has a positional parameters with the text required
  // and the other parameters optional
  const CustomText(
      {Key key, this.text, this.size, this.color, this.weight, this.family})
      : super(key: key);

  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final String family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16,
        color: color ?? Colors.black,
        fontWeight: weight ?? FontWeight.normal,
        fontFamily: family ?? 'Ubuntu',
      ),
    );
  }
}
