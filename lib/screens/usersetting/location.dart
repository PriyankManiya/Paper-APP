import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';
import 'package:paper_app/database/db_helper.dart';
import 'package:paper_app/helper/model/location_model.dart';

import 'add_location.dart';

class EditLocation extends StatefulWidget {
  EditLocation({Key key}) : super(key: key);

  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final GlobalKey<FormState> searchkey = GlobalKey<FormState>();
  List<LocationModel> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  getList() async {
    DBHelper dbHelper = DBHelper();
    GetStorage storage = GetStorage();
    int default_id = storage.read("default_id");
    if (default_id == null) {}
    await dbHelper.getEmployees().then((value) {
      setState(() {
        list = value;
      });
    });
    if (default_id == null) {
      storage.write("default_id", list[0].id);
    }

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == default_id) {
        list[i].isDefault = true;
        // break;
      } else {
        list[i].isDefault = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorTheme.white,
    actions: [
      IconButton(
        onPressed: () {
          Get.to(AddLocation()).then((value) {
            getList();
          });
        },
        icon: Icon(
          Icons.add,
          color: ColorTheme.black,
        ),
      )
    ],
    title: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                    "Locations",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                        color: ColorTheme.btnshade2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        )),
      ),
      body: SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          sizedbox(context, 30),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: TextFormField(
              // controller: pwdcontroller,
              cursorColor: ColorTheme.black,
              cursorHeight: 15,
              validator: (value) {
                return;
              },
              style: TextStyle(color: ColorTheme.black),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search for zip code or city",
                prefixIcon: Image.asset(
                  ImageProvide.minisearch,
                  height: 2,
                ),
                fillColor: ColorTheme.textboxgrey,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          sizedbox(context, 30),
          list == null || list.length == 0
              ? Center(
                  child: CupertinoActivityIndicator(),
                )
              : Expanded(
                  child: Column(
                      children: list
                          .map((value) => Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width:
                                        MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ColorTheme.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 130,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.address,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500,
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height /
                                                        55),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                value.postcode,
                                                style: TextStyle(
                                                    color: ColorTheme.black
                                                        .withOpacity(0.5),
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height /
                                                        65),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        value.isDefault
                                            ? Text(
                                                "Default City",
                                                style: TextStyle(
                                                    color: ColorTheme.black
                                                        .withOpacity(0.5),
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .height /
                                                        65),
                                              )
                                            : SizedBox.shrink(),
                                        SizedBox(width: 10),
                                        PopupMenuButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10)),
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem(
                                                  onTap: () {
                                                    GetStorage getStorage =
                                                        GetStorage();
                                                    getStorage.write(
                                                        "default_id",
                                                        value.id);
                                                    getList();
                                                  },
                                                  child: Text(
                                                      "Make it Default",
                                                      style: TextStyle(
                                                          color: ColorTheme
                                                              .black
                                                              .withOpacity(
                                                                  0.5))),
                                                ),
                                                PopupMenuItem(
                                                  child: Text("Remove",
                                                      style: TextStyle(
                                                          color: ColorTheme
                                                              .black
                                                              .withOpacity(
                                                                  0.5))),
                                                  onTap: () async {
                                                    DBHelper dbHelper = DBHelper();
                                                    await dbHelper.delete(value.id);
                                                    getList();
                                                  },
                                                ),
                                              ];
                                            })
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ))
                          .toList()),
                )
        ],
      ),
    ),
      ),
    );
  }
}
