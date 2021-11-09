import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';

BoxDecoration boxDecoration = BoxDecoration(
 
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorTheme.btnshade1, ColorTheme.btnshade2]),
);
