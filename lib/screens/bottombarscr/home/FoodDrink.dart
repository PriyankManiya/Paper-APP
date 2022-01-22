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

class FoodDrinkScreen extends StatefulWidget {
  String topic;
  FoodDrinkScreen({Key key, this.topic}) : super(key: key);
  @override
  _FoodDrinkScreenState createState() => _FoodDrinkScreenState();
}

class _FoodDrinkScreenState extends State<FoodDrinkScreen> {
  StreamController _streamController;
  int pagination = 2;
FollowController followController = Get.put(FollowController());
  final FoodDrinkController food_drink_controller =
      Get.find<FoodDrinkController>();
  RefreshController refershControllers =
      RefreshController(initialRefresh: false);
  LikeUnlikeController likeUnlikeController = Get.put(LikeUnlikeController());
  void _onRefresh() async {
    // await lifestyle_controller.fetchMarketnews(page: 1);
    await Future.delayed(Duration(milliseconds: 1000));
    refershControllers.refreshCompleted();
  }

  void _onLoading() async {
    _streamController = new StreamController();
    await food_drink_controller.fetchMarketnews(
        page: pagination,
        topic: widget.topic,
        nextUrl: food_drink_controller.localList.value.value[0].nextPageUrl);
    await _streamController.add(food_drink_controller.localList.value);
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
    getnewsdata();
  }

  void getnewsdata() async {
    await food_drink_controller.fetchMarketnews(
        page: 1, topic: widget.topic, nextUrl: null);
    _streamController.add(food_drink_controller.localList.value);
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return food_drink_controller.isLoading.value
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
          : Column(
              children: [
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10),
                //   width: Get.width,
                //   height: 50,
                //   child: Row(
                //     children: [
                //       Text(
                //         "New York City",
                //         style: TextStyle(
                //             fontSize: Get.height * 0.020,
                //             fontWeight: FontWeight.bold,
                //             color: ColorTheme.black),
                //       ),
                //       GestureDetector(
                //         // onTap: () {
                //         //   Get.to(Follow());
                //         // },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(horizontal: 10),
                //           child: Image.asset(
                //             ImageProvide.pencil,
                //             height: 20,
                //             width: 20,
                //           ),
                //         ),
                //       ),
                //       Spacer(),
                //       Container(
                //         padding: EdgeInsets.symmetric(horizontal: 10),
                //         child: Image.asset(
                //           ImageProvide.meter,
                //           height: 20,
                //           width: 20,
                //         ),
                //       ),
                //       Text(
                //         "69. F",
                //         style: TextStyle(
                //             fontSize: Get.height * 0.020,
                //             fontWeight: FontWeight.bold,
                //             color: ColorTheme.black),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                    child: StreamBuilder(
                  stream: _streamController.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Obx(
                      ()=> Scrollbar(
                        child: SmartRefresher(
                            enablePullDown: true,
                            enablePullUp: true,
                            controller: refershControllers,
                            onRefresh: _onRefresh,
                            onLoading: _onLoading,
                            child:  ListView.separated(
                                separatorBuilder: (context, index) {
                                  return Container(
                                    child: sizedbox(context, 50),
                                  );
                                },
                                itemCount: food_drink_controller
                                    .localList.value.value[0].subCards.length,
                                itemBuilder: (BuildContext context, int index) {
                                  GetStorage getStorage = GetStorage();
                                  String countryname =
                                      getStorage.read("countryname");
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                          () => NewsDetails(
                                              subCard: food_drink_controller
                                                  .localList
                                                  .value
                                                  .value[0]
                                                  .subCards[index]),
                                          transition: Transition.cupertino);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      width: MediaQuery.of(context).size.width,
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
                                                        BorderRadius.circular(50),
                                                    child: Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      50))),
                                                      child: CachedNetworkImage(
                                                        useOldImageOnUrlChange:
                                                            false,
                                                        fadeInDuration: Duration(
                                                            milliseconds: 500),
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            food_drink_controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .provider
                                                                .logo
                                                                .url,
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
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                  // backgroundImage: NetworkImage(
                                                  //     lifestyle_controller
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
                                                      onTap: () async {
                                                        // Get.to(() => FollowDisplay(),
                                                        //     transition:
                                                        //         Transition.cupertino);
                                                         if (food_drink_controller
                                                              .localList
                                                              .value
                                                              .value[0]
                                                              .subCards[index]
                                                              .provider
                                                              .follow) {
                                                            followController.unfollow(
                                                                id: food_drink_controller.localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[
                                                                        index]
                                                                    .provider
                                                                    .followid);

                                                            for (int i = 0;
                                                                i <
                                                                    food_drink_controller.localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards
                                                                        .length;
                                                                i++) {
                                                              if (food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[i]
                                                                      .provider
                                                                      .id ==
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .id) {
                                                                food_drink_controller.localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[i]
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
                                                              channelId:
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .id,
                                                              channel_details:
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .name,
                                                              channel_url:
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .logo
                                                                      .url,
                                                              title:
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .name,
                                                            );

                                                            for (int i = 0;
                                                                i <
                                                                    food_drink_controller.localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards
                                                                        .length;
                                                                i++) {
                                                              if (food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[i]
                                                                      .provider
                                                                      .id ==
                                                                  food_drink_controller.localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .id) {
                                                                food_drink_controller.localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[i]
                                                                    .provider
                                                                    .follow = true;

                                                                food_drink_controller.localList
                                                                    .value
                                                                    .value[0]
                                                                    .subCards[i]
                                                                    .provider
                                                                    .followid = id;
                                                              }
                                                            }
                                                          }

                                                          food_drink_controller.update();
                                                      },
                                                      child: Text(
                                                          food_drink_controller
                                                                      .localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[
                                                                          index]
                                                                      .provider
                                                                      .name ==
                                                                  null
                                                              ? "Paper-App"
                                                              : food_drink_controller
                                                                  .localList
                                                                  .value
                                                                  .value[0]
                                                                  .subCards[index]
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
                                                  init: food_drink_controller,
                                                  builder: (_) {
                                                    return InkWell(
                                                      onTap: () async {
                                                        // print("Follow Part");
                                                         if (food_drink_controller
                                                                      .localList
                                                                      .value
                                                                      .value[0]
                                                                      .subCards[index]
                                                                      .provider
                                                                      .follow) {
                                                                    followController.unfollow(
                                                                        id: food_drink_controller.localList
                                                                            .value
                                                                            .value[0]
                                                                            .subCards[
                                                                                index]
                                                                            .provider
                                                                            .followid);

                                                                    for (int i = 0;
                                                                        i <
                                                                            food_drink_controller.localList
                                                                                .value
                                                                                .value[0]
                                                                                .subCards
                                                                                .length;
                                                                        i++) {
                                                                      if (food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[i]
                                                                              .provider
                                                                              .id ==
                                                                          food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .id) {
                                                                        food_drink_controller.localList
                                                                            .value
                                                                            .value[0]
                                                                            .subCards[i]
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
                                                                      channelId:
                                                                          food_drink_controller
                                                                              .localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .id,
                                                                      channel_details:
                                                                          food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .name,
                                                                      channel_url:
                                                                          food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .logo
                                                                              .url,
                                                                      title:
                                                                          food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .name,
                                                                    );

                                                                    for (int i = 0;
                                                                        i <
                                                                            food_drink_controller.localList
                                                                                .value
                                                                                .value[0]
                                                                                .subCards
                                                                                .length;
                                                                        i++) {
                                                                      if (food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[i]
                                                                              .provider
                                                                              .id ==
                                                                          food_drink_controller.localList
                                                                              .value
                                                                              .value[0]
                                                                              .subCards[
                                                                                  index]
                                                                              .provider
                                                                              .id) {
                                                                        food_drink_controller.localList
                                                                            .value
                                                                            .value[0]
                                                                            .subCards[i]
                                                                            .provider
                                                                            .follow = true;

                                                                        food_drink_controller.localList
                                                                            .value
                                                                            .value[0]
                                                                            .subCards[i]
                                                                            .provider
                                                                            .followid = id;
                                                                      }
                                                                    }
                                                                  }

                                                                  food_drink_controller.update();
                                                      },
                                                      child: food_drink_controller
                                                                            .localList
                                                                            .value
                                                                            .value[0]
                                                                            .subCards[index]
                                                                            .provider
                                                                            .follow
                                                                        ? Text("FOLLOWED",
                                                                            style: TextStyle(
                                                                                color: ColorTheme
                                                                                    .green,
                                                                                fontWeight:
                                                                                    FontWeight
                                                                                        .bold,
                                                                                fontSize: MediaQuery.of(context)
                                                                                        .size
                                                                                        .height /
                                                                                    60))
                                                                        : Text("FOLLOW",
                                                                            style: TextStyle(
                                                                                color: ColorTheme
                                                                                    .green,
                                                                                fontWeight:
                                                                                    FontWeight
                                                                                        .bold,
                                                                                fontSize:
                                                                                    MediaQuery.of(context).size.height / 60)),
                                                    );
                                                  }
                                                ),
                                                sizedboxwidth(context, 20),
                                                Icon(Icons.more_vert_rounded)
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
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fit: BoxFit.cover,
                                              imageUrl: food_drink_controller
                                                          .localList
                                                          .value
                                                          .value[0]
                                                          .subCards[index]
                                                          .images !=
                                                      null
                                                  ? food_drink_controller
                                                      .localList
                                                      .value
                                                      .value[0]
                                                      .subCards[index]
                                                      .images[0]
                                                      .url
                                                  : "https://cdn.pixabay.com/photo/2021/12/04/10/58/nature-6844982__340.jpg",
                                              progressIndicatorBuilder: (context,
                                                      url, downloadProgress) =>
                                                  Center(
                                                child: CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                              Color>(
                                                          ColorTheme.btnshade2),
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
                                                  food_drink_controller
                                                              .localList
                                                              .value
                                                              .value[0]
                                                              .subCards[index]
                                                              .images !=
                                                          null
                                                      ? food_drink_controller
                                                          .localList
                                                          .value
                                                          .value[0]
                                                          .subCards[index]
                                                          .images[0]
                                                          .title
                                                      : "NO IMAGE",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              50),
                                                ),
                                                sizedbox(context, 60),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        ImageProvide.minilocation,
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height /
                                                                55),
                                                    sizedboxwidth(context, 50),
                                                    Text(
                                                      "$countryname",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              60),
                                                    ),
                                                    sizedboxwidth(context, 20),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          ColorTheme.btnshade2,
                                                      radius: 3,
                                                    ),
                                                    sizedboxwidth(context, 50),
                                                    Text(
                                                      timeago.format(
                                                          food_drink_controller
                                                              .localList
                                                              .value
                                                              .value[0]
                                                              .subCards[index]
                                                              .publishedDateTime),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                            child: GetBuilder(
                                                init: food_drink_controller,
                                                builder: (_) {
                                                  return InkWell(
                                                    onTap: () async {
                                                      // print(
                                                      //     "Like : ${newsController.newsList.value.value[0].subCards[index].like}");

                                                      if (food_drink_controller
                                                              .localList
                                                              .value
                                                              .value[0]
                                                              .subCards[index]
                                                              .like ==
                                                          true) {
                                                        print("Dislike");
                                                        likeUnlikeController.unlike(
                                                            id: food_drink_controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .likeid);

                                                        food_drink_controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .like = false;
                                                        food_drink_controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .totallike--;
                                                      } else {
                                                        String likeid =
                                                            await likeUnlikeController.like(
                                                                articleId:
                                                                    food_drink_controller
                                                                        .localList
                                                                        .value
                                                                        .value[0]
                                                                        .subCards[
                                                                            index]
                                                                        .id);

                                                        food_drink_controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .like = true;

                                                        food_drink_controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .likeid = likeid;

                                                        food_drink_controller
                                                            .localList
                                                            .value
                                                            .value[0]
                                                            .subCards[index]
                                                            .totallike++;
                                                      }

                                                      food_drink_controller
                                                          .update();
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        //like
                                                        food_drink_controller
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
                                                        food_drink_controller
                                                                .localList
                                                                .value
                                                                .value[0]
                                                                .subCards[index]
                                                                .like
                                                            ? Text(
                                                                "${food_drink_controller.localList.value.value[0].subCards[index].totallike}",
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
                                                                "${food_drink_controller.localList.value.value[0].subCards[index].totallike}",
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
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      ),
                    );
                  },
                )),
              ],
            );
    });
  }
}
