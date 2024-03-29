import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/controller/follow_controller.dart';
import 'package:paper_app/helper/controller/likeunlike_controller.dart';
import 'package:paper_app/screens/newsdetail/newsdetail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;

class Today extends StatefulWidget {
  String topic;
  Today({Key key, this.topic}) : super(key: key);
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  StreamController _streamController;
  int pagination = 2;
  bool isLoading = true;
  final TodayController today_Controller = Get.find<TodayController>();
  FollowController followController = Get.put(FollowController());
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  RefreshController refershControllers =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // await newsController.fetchMarketnews(page: 1);
    await Future.delayed(Duration(milliseconds: 1000));
    refershControllers.refreshCompleted();
  }

  void _onLoading() async {
    _streamController = new StreamController();
    await today_Controller.fetchMarketnews(
        page: pagination,
        topic: widget.topic,
        nextUrl: today_Controller.localList.value.value[0].nextPageUrl);
    await _streamController.add(today_Controller.localList.value);
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted)
      setState(() {
        pagination++;
      });
    refershControllers.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    _streamController = new StreamController();
    today_Controller.isLoading(true);
    getnewsdata();
  }

  void getnewsdata() async {
    await today_Controller.fetchMarketnews(
        page: 1, topic: widget.topic, nextUrl: null);
        print("Data : ${today_Controller.localList.value.value.length}");
    _streamController.add(today_Controller.localList.value);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          title: Text(
            "Today News",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 35,
                color: ColorTheme.btnshade2,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(() {
          return today_Controller.isLoading.value
              ? Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  ColorTheme.btnshade2))),
                    ],
                  ),
                )
              :  Column(
                      children: [
                        Expanded(
                            child: StreamBuilder(
                          stream: _streamController.stream,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            return Obx(
                              ()=> today_Controller.localList.value.value == null || today_Controller.localList.value.value.length == 0 || today_Controller.localList.value
                                          .value[0].subCards == null || today_Controller.localList.value
                                          .value[0].subCards.length == 0
                  ? Center(
                      child: Text("No Data Found"),
                    )
                  : Scrollbar(
                                child: SmartRefresher(
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    controller: refershControllers,
                                    onRefresh: _onRefresh,
                                    onLoading: _onLoading,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Container(
                                          child: sizedbox(context, 50),
                                        );
                                      },
                                      itemCount: today_Controller.localList.value
                                          .value[0].subCards.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        GetStorage getStorage = GetStorage();
                                        String countryname =
                                            getStorage.read("countryname");
                                        return InkWell(
                                          onTap: () {
                                            Get.to(
                                                () => NewsDetails(
                                                    subCard: today_Controller
                                                        .localList
                                                        .value
                                                        .value[0]
                                                        .subCards[index]),
                                                transition: Transition.cupertino);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            color: ColorTheme.white,
                                            child: Column(
                                              children: [
                                                //top part
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50))),
                                                            child:
                                                                CachedNetworkImage(
                                                              useOldImageOnUrlChange:
                                                                  false,
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fit: BoxFit.cover,
                                                              imageUrl:
                                                                  today_Controller
                                                                      .localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .logo
                                                                      .url,
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          downloadProgress) =>
                                                                      Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor: AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      ColorTheme
                                                                          .btnshade2),
                                                                ),
                                                              ),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                            ),
                                                          ),
                                                        ),
                                                        // backgroundImage: NetworkImage(
                                                        //     newsController
                                                        //         .localList
                                                        //         .value
                                                        //         .value[0]
                                                        //         .subCards[index]
                                                        //         .provider
                                                        //         .logo
                                                        //         .url),
                                                      ),
                                                      sizedboxwidth(context, 30),
                                                      Expanded(
                                                        child: Container(
                                                          width: Get.width * 0.5,
                                                          child: InkWell(
                                                            onTap: () {
                                                              // Get.to(() => FollowDisplay(),
                                                              //     transition:
                                                              //         Transition.cupertino);
                                                            },
                                                            child: Text(
                                                                today_Controller
                                                                            .localList
                                                                            .value
                                                                            .value[
                                                                                0]
                                                                            .subCards[
                                                                                index]
                                                                            .provider
                                                                            .name ==
                                                                        null
                                                                    ? "Paper-App"
                                                                    : today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .provider
                                                                        .name,
                                                                style: TextStyle(
                                                                    fontSize: MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .height /
                                                                        60)),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      GetBuilder(
                                                          init: today_Controller,
                                                          builder: (_) {
                                                            return InkWell(
                                                              onTap: () async {
                                                                // print("Follow Part");
                                                                if (today_Controller
                                                                    .localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[
                                                                        index]
                                                                    .provider
                                                                    .follow) {
                                                                  followController.unfollow(
                                                                      id: today_Controller
                                                                          .localList
                                                                          .value
                                                                          .value[
                                                                              0]
                                                                          .subCards[
                                                                              index]
                                                                          .provider
                                                                          .followid);

                                                                  for (int i = 0;
                                                                      i <
                                                                          today_Controller
                                                                              .localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards
                                                                              .length;
                                                                      i++) {
                                                                    if (today_Controller
                                                                            .localList
                                                                            .value
                                                                            .value[
                                                                                0]
                                                                            .subCards[
                                                                                i]
                                                                            .provider
                                                                            .id ==
                                                                        today_Controller
                                                                            .localList
                                                                            .value
                                                                            .value[
                                                                                0]
                                                                            .subCards[
                                                                                index]
                                                                            .provider
                                                                            .id) {
                                                                      today_Controller
                                                                          .localList
                                                                          .value
                                                                          .value[
                                                                              0]
                                                                          .subCards[
                                                                              i]
                                                                          .provider
                                                                          .follow = false;
                                                                    }
                                                                  }
                                                                  // newsController
                                                                  //     .newsList
                                                                  //     .value
                                                                  //     .value[0]
                                                                  //     .subCards[index]
                                                                  //     .provider
                                                                  //     .follow = false;
                                                                } else {
                                                                  String id =
                                                                      await followController
                                                                          .follow(
                                                                    channelId: today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .provider
                                                                        .id,
                                                                    channel_details: today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .provider
                                                                        .name,
                                                                    channel_url: today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .provider
                                                                        .logo
                                                                        .url,
                                                                    title: today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .provider
                                                                        .name,
                                                                  );

                                                                  for (int i = 0;
                                                                      i <
                                                                          today_Controller
                                                                              .localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards
                                                                              .length;
                                                                      i++) {
                                                                    if (today_Controller
                                                                            .localList
                                                                            .value
                                                                            .value[
                                                                                0]
                                                                            .subCards[
                                                                                i]
                                                                            .provider
                                                                            .id ==
                                                                        today_Controller
                                                                            .localList
                                                                            .value
                                                                            .value[
                                                                                0]
                                                                            .subCards[
                                                                                index]
                                                                            .provider
                                                                            .id) {
                                                                      today_Controller
                                                                          .localList
                                                                          .value
                                                                          .value[
                                                                              0]
                                                                          .subCards[
                                                                              i]
                                                                          .provider
                                                                          .follow = true;

                                                                      today_Controller
                                                                          .localList
                                                                          .value
                                                                          .value[
                                                                              0]
                                                                          .subCards[
                                                                              i]
                                                                          .provider
                                                                          .followid = id;
                                                                    }
                                                                  }
                                                                }

                                                                today_Controller
                                                                    .update();
                                                              },
                                                              child: today_Controller
                                                                      .localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .follow
                                                                  ? Text(
                                                                      "FOLLOWED",
                                                                      style: TextStyle(
                                                                          color: ColorTheme
                                                                              .green,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: MediaQuery.of(context).size.height /
                                                                              60))
                                                                  : Text("FOLLOW",
                                                                      style: TextStyle(
                                                                          color: ColorTheme
                                                                              .green,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              MediaQuery.of(context).size.height / 60)),
                                                            );
                                                          }),
                                                      sizedboxwidth(context, 20),
                                                      Icon(
                                                          Icons.more_vert_rounded)
                                                    ],
                                                  ),
                                                ),
                                                sizedbox(context, 60),
                                                //body part
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      3.8,
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fit: BoxFit.cover,
                                                    imageUrl: today_Controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .images !=
                                                            null
                                                        ? today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .images[0]
                                                            .url
                                                        : "https://cdn.pixabay.com/photo/2021/12/04/10/58/nature-6844982__340.jpg",
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                    Color>(
                                                                ColorTheme
                                                                    .btnshade2),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),

                                                sizedbox(context, 50),
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        today_Controller
                                                                    .localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[
                                                                        index]
                                                                    .images !=
                                                                null
                                                            ? today_Controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .images[0]
                                                                .title
                                                            : "NO IMAGE",
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                50),
                                                      ),
                                                      sizedbox(context, 60),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                              ImageProvide
                                                                  .minilocation,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  55),
                                                          sizedboxwidth(
                                                              context, 50),
                                                          Text(
                                                            "$countryname",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60),
                                                          ),
                                                          sizedboxwidth(
                                                              context, 20),
                                                          CircleAvatar(
                                                            backgroundColor:
                                                                ColorTheme
                                                                    .btnshade2,
                                                            radius: 3,
                                                          ),
                                                          sizedboxwidth(
                                                              context, 50),
                                                          Text(
                                                            timeago.format(
                                                                today_Controller
                                                                    .localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[
                                                                        index]
                                                                    .publishedDateTime),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    60),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                sizedbox(context, 30),
                                                //bottom part
                                                Container(
                                                  alignment: Alignment.centerLeft,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      // print(
                                                      //     "Like : ${newsController.newsList.value.value[0].subCards[index].like}");

                                                      if (today_Controller
                                                              .localList
                                                              .value
                                                              .value[0]
                                                              .subCards[index]
                                                              .like ==
                                                          true) {
                                                        print("Dislike");
                                                        likeUnlikeController.unlike(
                                                            id: today_Controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .likeid);

                                                        today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .like = false;
                                                        today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .totallike--;
                                                      } else {
                                                        String likeid =
                                                            await likeUnlikeController.like(
                                                                articleId:
                                                                    today_Controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .id);

                                                        today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .like = true;

                                                        today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .likeid = likeid;

                                                        today_Controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .totallike++;
                                                      }

                                                      today_Controller.update();
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        //like
                                                        today_Controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .like
                                                            ? Image.asset(
                                                                ImageProvide.like,
                                                                color: ColorTheme
                                                                    .btnshade2,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    40)
                                                            : Image.asset(
                                                                ImageProvide.like,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    40),
                                                        sizedboxwidth(
                                                            context, 25),
                                                        today_Controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .like
                                                            ? Text(
                                                                "${today_Controller.localList.value.value[0].subCards[index].totallike}",
                                                                style: TextStyle(
                                                                    color: ColorTheme
                                                                        .btnshade2,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .height /
                                                                        50))
                                                            : Text(
                                                                "${today_Controller.localList.value.value[0].subCards[index].totallike}",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize: MediaQuery.of(
                                                                                context)
                                                                            .size
                                                                            .height /
                                                                        50),
                                                              ),
                                                        Spacer(),
                                                        //comment
                                                        Image.asset(
                                                            ImageProvide.cmt,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                40),
                                                        sizedboxwidth(
                                                            context, 25),
                                                        Text(
                                                          "38",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  50),
                                                        ),
                                                        Spacer(),
                                                        //share
                                                        Image.asset(
                                                            ImageProvide
                                                                .outlineshare,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                40),
                                                        sizedboxwidth(
                                                            context, 25),
                                                        Text(
                                                          "22",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.w600,
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  50),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                              ),
                            );
                          },
                        )),
                      ],
                    );
        }));
    // });
  }
}
