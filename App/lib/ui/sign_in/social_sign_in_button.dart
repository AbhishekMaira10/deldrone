import 'package:deldrone_customer/custom_widgets/buttons/custom_raised_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(text != null),
        assert(assetName != null),
        super(
          childs: Row(
            children: <Widget>[
              Image.asset(assetName, height: 100.0, width: 100.0),
              Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16.0),
              ),
            ],
          ),
          color: color,
          onPressed: onPressed,
        );
}
