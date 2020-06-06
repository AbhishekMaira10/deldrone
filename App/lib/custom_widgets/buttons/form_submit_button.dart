import 'package:deldrone_customer/custom_widgets/buttons/custom_raised_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          childs: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: Colors.indigo,
          borderRadius: 25.0,
          onPressed: onPressed,
        );
}
