import 'package:flutter/material.dart';

class IntroWidget {
  Widget Indicator(Color color) {
    return Container(
      height: 8,
      width: 8,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
