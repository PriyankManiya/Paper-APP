import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';

class NewsSelect extends StatefulWidget {
  NewsSelect({Key key}) : super(key: key);

  @override
  State<NewsSelect> createState() => _NewsSelectState();
}

class _NewsSelectState extends State<NewsSelect> {
  bool _selected = false;
  List demo = [
    "local news",
    "Headline",
    "Releationship",
    "local news",
    "local news",
    "local news"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorTheme.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedbox(context, 10),
              Text("Customize your news\nand alerts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height / 30,
                  )),
              SizedBox(height: 10),
              Text("Set your favorite Topics now and\nmake it yours.",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 60,
                  )),
              sizedbox(context, 10),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  for (var i = 0; i <= demo.length; i++)
                    Container(
                      alignment: Alignment.center,
                      width: 95,
                      height: 25,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: i == 0
                                  ? ColorTheme.btnshade1
                                  : ColorTheme.grey)),
                      child: Text(
                        "Local News",
                        style: TextStyle(
                            color: i == 0
                                ? ColorTheme.btnshade1
                                : ColorTheme.grey),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
