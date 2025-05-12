// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/news_model.dart';
import 'package:leftapp_1/app/model/tables_model.dart';
import 'package:leftapp_1/app/news/card_news.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/app/tables/card_tables.dart';
import 'package:leftapp_1/app/tables/tables_edit.dart';
import 'package:leftapp_1/main.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_tab() async {
    var response = await _curd.postRequest(linkTabView, {"type": '0'});
    return response;
  }

  get_tab2() async {
    var response = await _curd.postRequest(linkTabView, {"type": '1'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // عدد الأقسام في TabBar
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("tab_add", (route) => false);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        appBar: AppBar(
          toolbarHeight: 120,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF053661), Color(0xFF0A74DA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            "ادارة الجداول",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(text: "جداول الدراسة"),
              Tab(text: "جداول الامتحانات"),
            ],
            indicatorColor: Colors.white, // لون المؤشر
            labelColor: Colors.white, // لون النص النشط
            unselectedLabelColor: Colors.white, // لون النص غير النشط
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: drawerapp(),
        body: TabBarView(
          children: [
            // محتوى القسم الأول
            isLoding == true
                ? Center(child: CircularProgressIndicator())
                : Container(
                    padding: EdgeInsets.all(5),
                    child: ListView(
                      children: [
                        FutureBuilder(
                            future: get_tab(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data['status'] == "fail") {
                                  return Center(
                                      child: Text(
                                    "لا توجد جداول حالياً",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ));
                                }
                                return ListView.builder(
                                  itemCount: snapshot.data['data'].length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, i) {
                                    return Card_tab(
                                      onDelete: () async {
                                        var response = await _curd
                                            .postRequest(linkTabDelete, {
                                          "id": snapshot.data['data'][i]['id']
                                              .toString(),
                                          "imagename": snapshot.data['data'][i]
                                                  ['image']
                                              .toString(),
                                        });

                                        Navigator.of(context)
                                            .pushNamedAndRemoveUntil(
                                                "tables", (route) => false);
                                      },
                                      ontap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Edit_tables(
                                                      tables: snapshot
                                                          .data['data'][i],
                                                    )));
                                      },
                                      tab_model: Tables_Model.fromJson(
                                          snapshot.data['data'][i]),
                                    );
                                  },
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: Text("يتم تحميل الجداول..."));
                              }
                              return Center(
                                  child: Text(
                                      "حدث خطأ ما... يرجى اعادة المحاولة"));
                            }),
                      ],
                    ),
                  ),
            // محتوى القسم الثاني
            Center(
              child: isLoding == true
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      padding: EdgeInsets.all(5),
                      child: ListView(
                        children: [
                          FutureBuilder(
                              future: get_tab2(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data['status'] == "fail") {
                                    return Center(
                                        child: Text(
                                      "لا توجد جداول حالياً",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ));
                                  }
                                  return ListView.builder(
                                    itemCount: snapshot.data['data'].length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, i) {
                                      return Card_tab(
                                        onDelete: () async {
                                          var response = await _curd
                                              .postRequest(linkTabDelete, {
                                            "id": snapshot.data['data'][i]['id']
                                                .toString(),
                                            "imagename": snapshot.data['data']
                                                    [i]['image']
                                                .toString(),
                                          });

                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  "tables", (route) => false);
                                        },
                                        ontap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Edit_tables(
                                                        tables: snapshot
                                                            .data['data'][i],
                                                      )));
                                        },
                                        tab_model: Tables_Model.fromJson(
                                            snapshot.data['data'][i]),
                                      );
                                    },
                                  );
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: Text("يتم تحميل الجداول..."));
                                }
                                return Center(
                                    child: Text(
                                        "حدث خطأ ما... يرجى اعادة المحاولة"));
                              }),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
