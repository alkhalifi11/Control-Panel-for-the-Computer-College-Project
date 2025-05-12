// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Informations/college_info/card_info.dart';
import 'package:leftapp_1/app/Informations/college_info/edit.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/college_model.dart';
import 'package:leftapp_1/app/model/news_model.dart';
import 'package:leftapp_1/app/news/card_news.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/main.dart';

class Info_coll extends StatefulWidget {
  const Info_coll({super.key});

  @override
  State<Info_coll> createState() => _NewsState();
}

class _NewsState extends State<Info_coll> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_coll() async {
    var response = await _curd.postRequest(linkView_info, {"type": '1'});
    return response;
  }

  get_coll2() async {
    var response = await _curd.postRequest(linkView_info, {"type": '2'});
    return response;
  }

  get_coll3() async {
    var response = await _curd.postRequest(linkView_info, {"type": '3'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      'عن كلية الحاسوب وتكنلوجا المعلومات',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
                  ),
                  FutureBuilder(
                      future: get_coll(),
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
                              return Card_info_coll(
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit_info(
                                            info: snapshot.data['data'][i],
                                          )));
                                },
                                coll_model: CollegeModel.fromJson(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Center(
                        child: Text(
                      'عن الاقسام الاكاديمية',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
                  ),
                  FutureBuilder(
                      future: get_coll2(),
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
                              return Card_info_coll(
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit_info(
                                            info: snapshot.data['data'][i],
                                          )));
                                },
                                coll_model: CollegeModel.fromJson(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Center(
                        child: Text(
                      'عن شؤون الطلاب',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                    )),
                  ),
                  FutureBuilder(
                      future: get_coll3(),
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
                              return Card_info_coll(
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit_info(
                                            info: snapshot.data['data'][i],
                                          )));
                                },
                                coll_model: CollegeModel.fromJson(
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
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }
}
