import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,
                                color: ColorTheme.btnshade2)),
                        sizedboxwidth(context, 30),
                        Text(
                          "History",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 35,
                              color: ColorTheme.btnshade2,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text("Edit",
                            style: TextStyle(
                                color: ColorTheme.green,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50)),
                      ],
                    )),
              )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              sizedbox(context, 30),
              Expanded(
                child: Container(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        height: 40,
                        thickness: 1,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "14 Cuts in 25 Minutes: How Hong Kong Censors Movies ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              45),
                                ),
                                sizedbox(context, 40),
                                Text(
                                  "Khaleej Times",
                                  style: TextStyle(
                                      color: ColorTheme.black.withOpacity(0.4),
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/trash2.jpg"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
