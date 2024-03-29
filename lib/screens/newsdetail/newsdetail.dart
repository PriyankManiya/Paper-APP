import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/article_controller.dart';
import 'package:paper_app/helper/controller/follow_controller.dart';
import 'package:paper_app/helper/controller/history_article_controller.dart';
import 'package:paper_app/helper/controller/likeunlike_controller.dart';
import 'package:paper_app/helper/model/news_model.dart' as news_model;
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatefulWidget {
  news_model.SubCard subCard;
  NewsDetails({Key key, this.subCard}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  ArticleController articleController = Get.find();
  HistoryArticleController articleHistoryController =
      Get.put(HistoryArticleController());
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  FollowController followController = Get.put(FollowController());
  bool isSaved = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    articleHistoryController.saveHistoryArticle(
        articleId: widget.subCard.id,
        article_url: widget.subCard.url,
        articleDetails: "${jsonEncode(widget.subCard.toJson())}",
        categoryId: widget.subCard.type);

    articleController.checkSavedStatus(widget.subCard.id);

    print("Status : ${articleController.isSaved.value}");
  }
  TextEditingController commentController = TextEditingController();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    print("widget.subCard.images :: ${widget.subCard.url}");
    return Scaffold(
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: ColorTheme.white,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 60,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: TextFormField(
                        cursorColor: ColorTheme.black,
                        cursorHeight: 15,
                        controller: commentController,
                        onFieldSubmitted: (val) {
                          Get.snackbar("Sucess", "Comment added successfully.",
                              snackStyle: SnackStyle.FLOATING);
                              setState(() {
                                commentController.text = "";
                              });
                        },
                        onSaved: (val) {
                          Get.snackbar("Sucess", "Comment added successfully.",
                              snackStyle: SnackStyle.FLOATING);
                              setState(() {
                                commentController.text = "";
                              });
                        },
                        
                        style: TextStyle(color: ColorTheme.black),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Your Comment",
                          hintStyle: TextStyle(color: ColorTheme.black),
                          fillColor: Color(0xffEDEDED),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),
                ),
                Spacer(),
                Image.asset(ImageProvide.cmt,
                    height: MediaQuery.of(context).size.height / 30),
                Spacer(),
                InkWell(
                  onTap: () async {
                    if (widget.subCard.like == true) {
                      print("Dislike");
                      likeUnlikeController.unlike(id: widget.subCard.likeid);
                      setState(() {
                        widget.subCard.like = false;
                        widget.subCard.totallike--;
                      });
                    } else {
                      String likeid = await likeUnlikeController.like(
                          articleId: widget.subCard.id);
                      setState(() {
                        widget.subCard.like = true;

                        widget.subCard.likeid = likeid;

                        widget.subCard.totallike++;
                      });
                    }
                  },
                  child: widget.subCard.like
                      ? Image.asset(ImageProvide.like,
                          color: ColorTheme.btnshade2,
                          height: MediaQuery.of(context).size.height / 30)
                      : Image.asset(ImageProvide.like,
                          height: MediaQuery.of(context).size.height / 30),
                ),
                Spacer(),
                GestureDetector(
                  onTap : () {
                     Share.share(widget.subCard.url, subject: 'Articale Link');
                  },
                  child: Image.asset(ImageProvide.share,
                      height: MediaQuery.of(context).size.height / 25),
                ),
                Padding(padding: EdgeInsets.only(right: 5))
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          elevation: 1.0,
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: SafeArea(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_ios, color: ColorTheme.black)),
                  sizedboxwidth(context, 50),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: CachedNetworkImage(
                                    useOldImageOnUrlChange: false,
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        widget.subCard.provider.logo.url + "1",
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    ColorTheme.btnshade2),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset("assets/images/logo.png")),
                              ),
                            ),
                            //   // backgroundImage: NetworkImage(
                            //   //     lifestyle_controller
                            //   //         .localList
                            //   //         .value
                            //   //         .value[0]
                            //   //         .subCards[index]
                            //   //         .provider
                            //   //         .logo
                            //   //         .url),
                          ),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                    widget.subCard.provider.name != null
                                        ? widget.subCard.provider.name
                                        : "",
                                    softWrap: true,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                60)),
                              ),
                              Text("83.3 K Followers",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              65))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  sizedboxwidth(context, 70),
                  InkWell(
                    onTap: () async {
                      // print("Follow Part");
                      if (widget.subCard.provider.follow) {
                        followController.unfollow(
                            id: widget.subCard.provider.followid);

                        // for (int i = 0;
                        //     i <
                        //         today_Controller
                        //             .localList.value.value[0].subCards.length;
                        //     i++) {
                        //   if (widget.subCard.provider.id ==
                        //       widget.subCard.provider.id) {
                        setState(() {
                          widget.subCard.provider.follow = false;
                        });

                        // }
                        // }
                        // newsController
                        //     .newsList
                        //     .value
                        //     .value[0]
                        //     .subCards[index]
                        //     .provider
                        //     .follow = false;
                      } else {
                        String id = await followController.follow(
                          channelId: widget.subCard.provider.id,
                          channel_details: widget.subCard.provider.name,
                          channel_url: widget.subCard.provider.logo.url,
                          title: widget.subCard.provider.name,
                        );

                        // for (int i = 0;
                        //     i <
                        //         today_Controller
                        //             .localList.value.value[0].subCards.length;
                        //     i++) {
                        // if (widget.subCard.provider.id ==
                        //     widget.subCard.provider.id) {
                        setState(() {
                          widget.subCard.provider.follow = true;

                          widget.subCard.provider.followid = id;
                        });

                        // }
                        // }
                      }
                    },
                    child: widget.subCard.provider.follow
                        ? Text("FOLLOWED",
                            style: TextStyle(
                                color: ColorTheme.green,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 60))
                        : Text("FOLLOW",
                            style: TextStyle(
                                color: ColorTheme.green,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height / 60)),
                  ),
                  sizedboxwidth(context, 20),
                  GetBuilder(
                    init: articleController,
                    builder: (_) => InkWell(
                      onTap: () {
                        if (articleController.isSaved.value) {
                          articleController
                              .removeArticle(articleController.removeid.value);
                        } else {
                          articleController.saveArticle(
                              articleId: widget.subCard.id,
                              article_url: widget.subCard.url,
                              articleDetails:
                                  "${jsonEncode(widget.subCard.toJson())}",
                              categoryId: widget.subCard.type);
                        }

                        // setState(() {
                        articleController.isSaved.value =
                            !articleController.isSaved.value;
                        // });
                        articleController.update();
                        // print("TEST ::::${jsonEncode(widget.subCard.toJson())}");
                      },
                      child: Icon(articleController.isSaved.value
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined),
                    ),
                  ),
                  sizedboxwidth(context, 20),
                  Icon(Icons.more_vert_rounded)
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: widget.subCard.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onProgress: (int progress) {
                print("WebView is loading (progress : $progress%)");
              },
              javascriptChannels: <JavascriptChannel>{
                // _toasterJavascriptChannel(context),
              },
              // navigationDelegate: (NavigationRequest request) {
              //   if (request.url.startsWith('https://www.youtube.com/')) {
              //     print('blocking navigation to $request}');
              //     return NavigationDecision.prevent;
              //   }
              //   print('allowing navigation to $request');
              //   return NavigationDecision.navigate;
              // },
              onPageStarted: (String url) {
                setState(() {
                  isLoading = true;
                });
                print('Page started loading: $url');
              },
              onPageFinished: (String url) {
                setState(() {
                  isLoading = false;
                });
                // print('Page finished loading: $q');
              },
              gestureNavigationEnabled: true,
            ),
            // isLoading
            //     ? Container(
            //         child: Center(
            //             child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             CircularProgressIndicator(
            //               valueColor: new AlwaysStoppedAnimation<Color>(
            //                   ColorTheme.btnshade1),
            //             ),
            //           ],
            //         )),
            //       )
            //     : SizedBox()
          ],
        )
        //body: CustomScrollView(
        //   physics: BouncingScrollPhysics(),
        //   slivers: [
        //     SliverFillRemaining(
        //       hasScrollBody: true,
        //       child: Container(
        //         color: ColorTheme.white,
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Expanded(
        //                 child: ListView(
        //               children: [
        //                 Column(
        //                   children: [
        //                     sizedbox(context, 30),
        //                     Container(
        //                       padding: EdgeInsets.symmetric(horizontal: 20),
        //                       child: Text(
        //                         widget.subCard.title != null
        //                             ? widget.subCard.title
        //                             : "",
        //                         maxLines: 2,
        //                         overflow: TextOverflow.ellipsis,
        //                         style: TextStyle(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize:
        //                                 MediaQuery.of(context).size.height /
        //                                     35),
        //                       ),
        //                     ),
        //                     sizedbox(context, 40),
        //                     Container(
        //                       padding: EdgeInsets.symmetric(horizontal: 20),
        //                       child: Row(
        //                         children: [
        //                           Image.asset(ImageProvide.minilocation,
        //                               height:
        //                                   MediaQuery.of(context).size.height /
        //                                       55),
        //                           sizedboxwidth(context, 50),
        //                           Text(
        //                             "New York",
        //                             style: TextStyle(
        //                                 fontWeight: FontWeight.w400,
        //                                 fontSize:
        //                                     MediaQuery.of(context).size.height /
        //                                         60),
        //                           ),
        //                           sizedboxwidth(context, 20),
        //                           CircleAvatar(
        //                             backgroundColor: ColorTheme.btnshade2,
        //                             radius: 3,
        //                           ),
        //                           sizedboxwidth(context, 50),
        //                           Text(
        //                             widget.subCard.publishedDateTime != null
        //                                 ? timeago.format(widget.subCard.publishedDateTime)
        //                                 : "",
        //                             style: TextStyle(
        //                                 fontWeight: FontWeight.w400,
        //                                 fontSize:
        //                                     MediaQuery.of(context).size.height /
        //                                         60),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                     sizedbox(context, 50),
        //                     Container(
        //                       height: MediaQuery.of(context).size.height / 3.8,
        //                       child: CachedNetworkImage(
        //                         fadeInDuration: Duration(milliseconds: 500),
        //                         fit: BoxFit.cover,
        //                         imageUrl: widget.subCard.images[0].url,
        //                         progressIndicatorBuilder:
        //                             (context, url, downloadProgress) => Center(
        //                           child: CircularProgressIndicator(
        //                             valueColor: AlwaysStoppedAnimation<Color>(
        //                                 ColorTheme.btnshade2),
        //                           ),
        //                         ),
        //                         errorWidget: (context, url, error) =>
        //                             Icon(Icons.error),
        //                       ),
        //                     ),
        //                     sizedbox(context, 40),
        //                     Container(
        //                       padding: EdgeInsets.symmetric(horizontal: 20),
        //                       child: Column(
        //                         children: [
        //                           // Text(
        //                           //   widget.subCard.images != null
        //                           //       ? widget.subCard.images[0].caption !=
        //                           //               null
        //                           //           ? widget.subCard.images[0].caption
        //                           //           : ""
        //                           //       : "",
        //                           //   style: TextStyle(
        //                           //     height: 1.5,
        //                           //     fontSize:
        //                           //         MediaQuery.of(context).size.height /
        //                           //             50,
        //                           //   ),
        //                           // ),
        //                           Html(
        //                             data :widget.subCard.images != null
        //                                 ? widget.subCard.images[0].caption !=
        //                                         null
        //                                     ? widget.subCard.images[0].caption
        //                                     : ""
        //                                 : "",
        //                             // style: TextStyle(
        //                             //   height: 1.5,
        //                             //   fontSize:
        //                             //       MediaQuery.of(context).size.height /
        //                             //           50,
        //                             // ),
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 // sizedbox(context, 40),
        //                 // Container(
        //                 //   width: MediaQuery.of(context).size.width,
        //                 //   height: 10,
        //                 //   color: ColorTheme.lightgrey,
        //                 // ),
        //                 // sizedbox(context, 40),
        //                 // Padding(
        //                 //   padding: const EdgeInsets.symmetric(horizontal: 10),
        //                 //   child: Text(
        //                 //     "You May also like",
        //                 //     style: TextStyle(
        //                 //         fontWeight: FontWeight.bold,
        //                 //         fontSize:
        //                 //             MediaQuery.of(context).size.height / 50,
        //                 //         color: ColorTheme.black.withOpacity(0.2)),
        //                 //   ),
        //                 // ),
        //                 // sizedbox(context, 40),
        //                 // Container(
        //                 //   padding: EdgeInsets.symmetric(horizontal: 10),
        //                 //   child: Row(
        //                 //     children: [
        //                 //       Expanded(
        //                 //         flex: 2,
        //                 //         child: Column(
        //                 //           crossAxisAlignment: CrossAxisAlignment.start,
        //                 //           children: [
        //                 //             Text(
        //                 //               "14 Cuts in 25 Minutes: How Hong Kong Censors Movies ",
        //                 //               style: TextStyle(
        //                 //                   fontWeight: FontWeight.bold,
        //                 //                   fontSize: MediaQuery.of(context)
        //                 //                           .size
        //                 //                           .height /
        //                 //                       45),
        //                 //             ),
        //                 //             sizedbox(context, 40),
        //                 //             Text(
        //                 //               "Khaleej Times",
        //                 //               style: TextStyle(
        //                 //                   color:
        //                 //                       ColorTheme.black.withOpacity(0.4),
        //                 //                   fontSize: MediaQuery.of(context)
        //                 //                           .size
        //                 //                           .height /
        //                 //                       60),
        //                 //             ),
        //                 //           ],
        //                 //         ),
        //                 //       ),
        //                 //       Container(
        //                 //         height: 80,
        //                 //         width: 80,
        //                 //         decoration: BoxDecoration(
        //                 //             borderRadius: BorderRadius.circular(15),
        //                 //             image: DecorationImage(
        //                 //                 image: AssetImage(
        //                 //                     "assets/images/trash2.jpg"),
        //                 //                 fit: BoxFit.cover)),
        //                 //       )
        //                 //     ],
        //                 //   ),
        //                 // ),
        //                 // sizedbox(context, 40),
        //               ],
        //             )),
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // )
        );
  }
}
