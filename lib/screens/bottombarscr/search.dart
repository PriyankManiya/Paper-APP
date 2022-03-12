import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/helper/controller/search_news_controller.dart';
import 'package:paper_app/screens/newsdetail/newsdetail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchNewsController searchNewsController =
      Get.put(SearchNewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 52),
        child: Container(
          color: ColorTheme.btnshade2,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 00, left: 22),
                        width: MediaQuery.of(context).size.width / 1.2,
                        // height: 43,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color:
                                    ColorTheme.textboxgrey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: InkWell(
                                      child: TextField(
                                        cursorColor: ColorTheme.white,
                                        style: TextStyle(
                                            color: ColorTheme.white),
                                        keyboardType: TextInputType.text,
                                        onChanged: (value) async {
                                          print("value : $value");
                                          await searchNewsController
                                              .fetchMarketnews(
                                                  nextUrl: null,
                                                  search: value);
                                          // _streamController.add(newsController.newsList.value);
                                        },
                                        decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedErrorBorder:
                                              InputBorder.none,
                                          hintText: "Search News",
                                          hintStyle: TextStyle(
                                            color: ColorTheme.white,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              style: BorderStyle.solid,
                                              color: ColorTheme.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImageProvide.seach,
                                  height: 20,
                                  width: 20,
                                  // scale: 3.5,
                                  color: ColorTheme.white,
                                )
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => searchNewsController.newsList.value.value == null ||
                searchNewsController.newsList.value.value.length == 0
            ? Center(child: Text("No Data"))
            : ListView.separated(
                padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                physics: BouncingScrollPhysics(),
                itemCount: searchNewsController
                    .newsList.value.value[0].subCards.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 40,
                    thickness: 1,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                          () => NewsDetails(
                              subCard: searchNewsController
                                  .newsList.value.value[0].subCards[index]),
                          transition: Transition.cupertino);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${searchNewsController.newsList.value.value[0].subCards[index].images[0].url}"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${searchNewsController.newsList.value.value[0].subCards[index].title}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            45),
                              ),
                              sizedbox(context, 40),
                              Text(
                                "",
                                style: TextStyle(
                                    color: ColorTheme.black.withOpacity(0.4),
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            60),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
