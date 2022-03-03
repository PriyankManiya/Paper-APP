import 'package:flutter/material.dart';
import 'package:paper_app/constants/colortheme.dart';
import 'package:paper_app/constants/customespace.dart';
import 'package:paper_app/constants/imageprovider.dart';

class EditLocation extends StatefulWidget {
  EditLocation({Key key}) : super(key: key);

  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final GlobalKey<FormState> searchkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorTheme.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorTheme.white,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: ColorTheme.btnshade2)),
          title: Text(
            "Locations",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 35,
                color: ColorTheme.btnshade2,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.add, color: ColorTheme.black,),
            )
          ],
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
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorTheme.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New York City",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.height / 55),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "NY 10001",
                          style: TextStyle(
                              color: ColorTheme.black.withOpacity(0.5),
                              fontSize:
                                  MediaQuery.of(context).size.height / 65),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      "Default City",
                      style: TextStyle(
                          color: ColorTheme.black.withOpacity(0.5),
                          fontSize: MediaQuery.of(context).size.height / 65),
                    ),
                    SizedBox(width: 10),
                    PopupMenuButton(

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              
                              child: Text("Make it Default",
                                  style: TextStyle(
                                      color:
                                          ColorTheme.black.withOpacity(0.5))),
                            ),
                            PopupMenuItem(
                              child: Text("Remove",
                                  style: TextStyle(
                                      color:
                                          ColorTheme.black.withOpacity(0.5))),
                            ),
                          ];
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
