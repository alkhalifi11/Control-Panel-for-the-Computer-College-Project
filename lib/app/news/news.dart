// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/news_model.dart';
import 'package:leftapp_1/app/news/card_news.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/main.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  bool isLoding = false;

  Curd _curd = Curd();

  getNews() async {
    var response = await _curd.postRequest(linkView, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("addNews", (route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: getNews(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد اخبار حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return CardNews(
                                onDelete: () async {
                                  var response =
                                      await _curd.postRequest(linkDelete, {
                                    "id": snapshot.data['data'][i]['news_id']
                                        .toString(),
                                    "imagename": snapshot.data['data'][i]
                                            ['news_image']
                                        .toString(),
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "home", (route) => false);
                                },
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditNews(
                                            news: snapshot.data['data'][i],
                                          )));
                                },
                                newsmodel: NewsModel.fromJson(
                                    snapshot.data['data'][i]),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("يتم تحميل الاخبار..."));
                        }
                        return Center(
                            child: Text("حدث خطأ ما... يرجى اعادة المحاولة"));
                      }),
                ],
              ),
            ),
    );
  }
}
