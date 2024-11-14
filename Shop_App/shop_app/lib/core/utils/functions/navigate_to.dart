import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return screen;
  }), (route) => false);
}
