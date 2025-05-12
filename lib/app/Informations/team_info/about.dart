// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Informations/college_info/card_info.dart';
import 'package:leftapp_1/app/Informations/team_info/card_info.dart';
import 'package:leftapp_1/app/Informations/team_info/edit.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/college_model.dart';
import 'package:leftapp_1/app/model/news_model.dart';
import 'package:leftapp_1/app/model/team_model.dart';
import 'package:leftapp_1/app/news/card_news.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/main.dart';

class Info_Team extends StatefulWidget {
  const Info_Team({super.key});

  @override
  State<Info_Team> createState() => _NewsState();
}

class _NewsState extends State<Info_Team> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_Team() async {
    var response = await _curd.postRequest(linkView_Team, {"type": '1'});
    return response;
  }

  get_Team2() async {
    var response = await _curd.postRequest(linkView_Team, {"type": '2'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("info_team_add", (route) => false);
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: Text(
                      'الكادر الاداري',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
                  ),
                  FutureBuilder(
                      future: get_Team(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد معلومات حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return Card_info_Team(
                                onDelete: () async {
                                  var response =
                                      await _curd.postRequest(linkCuDelete, {
                                    "id": snapshot.data['data'][i]['id']
                                        .toString(),
                                    "imagename": snapshot.data['data'][i]
                                            ['file']
                                        .toString()
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "home_page_info", (route) => false);
                                },
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit_info_team(
                                            team: snapshot.data['data'][i],
                                          )));
                                },
                                team_model: Team_Model.fromJson(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Center(
                        child: Text(
                      'الكادر التدريسي',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
                  ),
                  FutureBuilder(
                      future: get_Team2(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد معلومات حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return Card_info_Team(
                                onDelete: () async {
                                  var response =
                                      await _curd.postRequest(linkCuDelete, {
                                    "id": snapshot.data['data'][i]['id']
                                        .toString(),
                                    "imagename": snapshot.data['data'][i]
                                            ['file']
                                        .toString()
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "home_page_info", (route) => false);
                                },
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => EditNews(
                                            news: snapshot.data['data'][i],
                                          )));
                                },
                                team_model: Team_Model.fromJson(
                                    snapshot.data['data'][i]),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("يتم تحميل المعلومات..."));
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
