import 'package:flutter/cupertino.dart';

sizedbox(context, hei) {
  return SizedBox(height: MediaQuery.of(context).size.height / hei);
}


sizedboxwidth(context, wed) {
  return SizedBox(width: MediaQuery.of(context).size.width / wed);
}
