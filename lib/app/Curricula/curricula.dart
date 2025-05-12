// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Curricula/card_cu.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/cu_model.dart';
import 'package:leftapp_1/main.dart';

//صفحة المناهج
class Curricula extends StatefulWidget {
  const Curricula({super.key});

  @override
  State<Curricula> createState() => _LibraryState();
}

class _LibraryState extends State<Curricula> {
  Curd _curd = Curd();

  getCu() async {
    var response =
        await _curd.postRequest(linkCuView, {"id": sharedpref.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("addcu", (route) => false);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            FutureBuilder(
                future: getCu(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == "fail") {
                      return Center(
                          child: Text(
                        "لا توجد ملفات حالياً",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data['data'].length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, i) {
                        return CardCu(
                          onDelete: () async {
                            var response =
                                await _curd.postRequest(linkCuDelete, {
                              "id": snapshot.data['data'][i]['id'].toString(),
                              "filesname":
                                  snapshot.data['data'][i]['file'].toString()
                            });

                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "home", (route) => false);
                          },
                          ontap: () {},
                          cumodel:
                              CurriModel.fromJson(snapshot.data['data'][i]),
                        );
                      },
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loding"));
                  }
                  return Center(child: Text("Loding"));
                }),
          ],
        ),
      ),
    ));
  }
}
