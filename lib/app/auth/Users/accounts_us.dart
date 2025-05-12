// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_final_fields, camel_case_types, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/auth/Users/card_accounts.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/us_model.dart';

class Accounts_us extends StatefulWidget {
  const Accounts_us({super.key});

  @override
  State<Accounts_us> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Accounts_us> {
  bool isLoding = false;

  Curd _curd = Curd();

  getAcc_Admin() async {
    var response = await _curd.postRequest(linkView_US, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("Add_Accounts_Us", (route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: drawerapp(),
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text('جميع حسابات المستخدمين',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))),
                  ),
                  FutureBuilder(
                      future: getAcc_Admin(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد حسابات حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return CardAccountsUers(
                                onDelete: () async {
                                  var response =
                                      await _curd.postRequest(linkDelete_US, {
                                    "id": snapshot.data['data'][i]['id']
                                        .toString(),
                                  });

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "accounts", (route) => false);
                                },
                                ontap: () {},
                                accounts_model: Accounts_UsModel.fromJson(
                                    snapshot.data['data'][i]),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("يتم تحميل الحسابات..."));
                        }
                        return Center(
                            child: Text("حدث خطأ ما... يرجى اعادة المحاولة"));
                      }),
                ],
              ),
            ),
    ));
  }
}
