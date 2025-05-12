// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/alerts/card_alertn.dart';
import 'package:leftapp_1/app/alerts/edit_alerts.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/alerts_model.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/main.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_Alwrts() async {
    var response = await _curd.postRequest(linkAlView, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("add_alerts", (route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
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
          "لوحة التحكم",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      drawer: drawerapp(),
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: get_Alwrts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد تنبيهات حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return Card_alerts(
                                onDelete: () async {
                                  var response =
                                      await _curd.postRequest(linkALDelete, {
                                    "id": snapshot.data['data'][i]['id']
                                        .toString(),
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "alerts", (route) => false);
                                },
                                ontap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Edit_Alerts(
                                            alerts: snapshot.data['data'][i],
                                          )));
                                },
                                alerts_model: Alerts_Model.fromJson(
                                    snapshot.data['data'][i]),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("يتم تحميل التنبيهات..."));
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
