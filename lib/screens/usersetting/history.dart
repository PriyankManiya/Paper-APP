import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/history_article_controller.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistoryArticleController historyArticleController =
      Get.put(HistoryArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorTheme.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: ColorTheme.btnshade2)),
        title: Text(
          "History",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 35,
              color: ColorTheme.btnshade2,
              fontWeight: FontWeight.bold),
        ),
        // bottom: PreferredSize(
        //     child: Padding(
        //       padding:
        //           const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        //       child: Container(
        //           alignment: Alignment.centerLeft,
        //           child: Row(
        //             children: [
        //               InkWell(
        //                   onTap: () {
        //                     Navigator.pop(context);
        //                   },
        //                   child: Icon(Icons.arrow_back_ios,
        //                       color: ColorTheme.btnshade2)),
        //               sizedboxwidth(context, 30),
        //               Text(
        //                 "History",
        //                 style: TextStyle(
        //                     fontSize: MediaQuery.of(context).size.height / 35,
        //                     color: ColorTheme.btnshade2,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               // Spacer(),
        //               // Text("Edit",
        //               //     style: TextStyle(
        //               //         color: ColorTheme.green,
        //               //         fontSize:
        //               //             MediaQuery.of(context).size.height / 50)),
        //             ],
        //           )),
        //     )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            sizedbox(context, 30),
            Expanded(
              child: Container(
                child: Obx(
                  () => historyArticleController.isLoading.value
                      ? Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : historyArticleController.savedList == null ||
                              historyArticleController.savedList.length == 0
                          ? Center(
                              child: Text("No Data FOund"),
                            )
                          : ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount:
                                  historyArticleController.savedList.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                    height: 40,
                                    thickness: 1,
                                  );
                                },
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          historyArticleController
                                              .removeHistoryArticle(
                                                  historyArticleController
                                                      .savedList[index].id);
                                        },
                                        icon:
                                            Image.asset(ImageProvide.close)),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${jsonDecode(historyArticleController.savedList[index].articleDetails)['title']}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        45),
                                          ),
                                          sizedbox(context, 40),
                                          Text(
                                            "${jsonDecode(historyArticleController.savedList[index].articleDetails)['provider']['name']}",
                                            style: TextStyle(
                                                color: ColorTheme.black
                                                    .withOpacity(0.4),
                                                fontSize:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        60),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${jsonDecode(historyArticleController.savedList[index].articleDetails)['images'][0]['url']}"),
                                              fit: BoxFit.cover)),
                                    )
                                  ],
                                );
                              },
                            ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
