import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/fetchnews_controller.dart';
import 'package:paper_app/helper/service/remote_service.dart';
import 'package:paper_app/screens/following/follow.dart';
import 'package:paper_app/screens/newsdetail/newsdetail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ForYou extends StatefulWidget {
  @override
  _ForYouState createState() => _ForYouState();
}

class _ForYouState extends State<ForYou> {
  bool isLoading = false;

  final NewsController newsController = Get.find<NewsController>();
  RefreshController refershControllers =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    await newsController.fetchMarketnews(page: 1);
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      isLoading = true;
    });
    refershControllers.refreshCompleted();
  }

  void _onLoading() async {
    await newsController.fetchMarketnews(page: 2);
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    refershControllers.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: Get.width,
          height: 50,
          child: Row(
            children: [
              Text(
                "New York City",
                style: TextStyle(
                    fontSize: Get.height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.black),
              ),
              GestureDetector(
                // onTap: () {
                //   Get.to(Follow());
                // },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    ImageProvide.pencil,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  ImageProvide.meter,
                  height: 20,
                  width: 20,
                ),
              ),
              Text(
                "69. F",
                style: TextStyle(
                    fontSize: Get.height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: ColorTheme.black),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return newsController.isLoading.value
                ? Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              ColorTheme.btnshade2)),
                    ),
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
                          itemCount:
                              newsController.newsList.value.articles.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                    () => NewsDetails(
                                        subCard: newsController
                                            .newsList.value.articles[index]),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          // CircleAvatar(
                                          //   backgroundColor: Colors.transparent,
                                          //   child: ClipRRect(
                                          //     borderRadius:
                                          //         BorderRadius.circular(50),
                                          //     child: Container(
                                          //       height: 50,
                                          //       width: 50,
                                          //       decoration: BoxDecoration(
                                          //           borderRadius: BorderRadius.all(
                                          //               Radius.circular(50))),
                                          //       child: CachedNetworkImage(
                                          //         useOldImageOnUrlChange: false,
                                          //         fadeInDuration:
                                          //             Duration(milliseconds: 500),
                                          //         fit: BoxFit.cover,
                                          //         imageUrl: newsController
                                          //             .newsList
                                          //             .value
                                          //             .value[0]
                                          //             .subCards[index]
                                          //             .provider
                                          //             .logo
                                          //             .url,
                                          //         progressIndicatorBuilder:
                                          //             (context, url,
                                          //                     downloadProgress) =>
                                          //                 Center(
                                          //           child:
                                          //               CircularProgressIndicator(
                                          //             valueColor:
                                          //                 AlwaysStoppedAnimation<
                                          //                         Color>(
                                          //                     ColorTheme.btnshade2),
                                          //           ),
                                          //         ),
                                          //         errorWidget:
                                          //             (context, url, error) =>
                                          //                 Icon(Icons.error),
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   // backgroundImage: NetworkImage(
                                          //   //     newsController
                                          //   //         .newsList
                                          //   //         .value
                                          //   //         .value[0]
                                          //   //         .subCards[index]
                                          //   //         .provider
                                          //   //         .logo
                                          //   //         .url),
                                          // ),

                                          sizedboxwidth(context, 30),
                                          Container(
                                            width: Get.width * 0.5,
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(() => FollowDisplay(),
                                                    transition:
                                                        Transition.cupertino);
                                              },
                                              child: Text(
                                                  newsController
                                                              .newsList
                                                              .value
                                                              .articles[index]
                                                              .author ==
                                                          null
                                                      ? "Paper-App"
                                                      : newsController
                                                          .newsList
                                                          .value
                                                          .articles[index]
                                                          .author,
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              60)),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              print("Follow Part");
                                            },
                                            child: Text("FOLLOW",
                                                style: TextStyle(
                                                    color: ColorTheme.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            60)),
                                          ),
                                          sizedboxwidth(context, 20),
                                          Icon(Icons.more_vert_rounded)
                                        ],
                                      ),
                                    ),
                                    sizedbox(context, 60),
                                    //body part
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3.8,
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 500),
                                        fit: BoxFit.cover,
                                        imageUrl: newsController.newsList.value
                                            .articles[index].urlToImage,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    ColorTheme.btnshade2),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),

                                    sizedbox(context, 50),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newsController.newsList.value
                                                .articles[index].title,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50),
                                          ),
                                          sizedbox(context, 60),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  ImageProvide.minilocation,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      55),
                                              sizedboxwidth(context, 50),
                                              Text(
                                                "New York",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                                "1 day ago",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        MediaQuery.of(context)
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //like
                                          Image.asset(ImageProvide.like,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40),
                                          sizedboxwidth(context, 25),
                                          Text(
                                            "290",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50),
                                          ),
                                          Spacer(),
                                          //comment
                                          Image.asset(ImageProvide.cmt,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40),
                                          sizedboxwidth(context, 25),
                                          Text(
                                            "38",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50),
                                          ),
                                          Spacer(),
                                          //share
                                          Image.asset(ImageProvide.outlineshare,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40),
                                          sizedboxwidth(context, 25),
                                          Text(
                                            "22",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  );
          }),
        ),
      ],
    );
  }
}