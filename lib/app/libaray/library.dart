// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/libaray/card_libar.dart';
import 'package:leftapp_1/app/model/lib_model.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  Curd _curd = Curd();

  getNews() async {
    var response = await _curd.postRequest(linkFilesView, {"id": "id"});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("addfiles", (route) => false);
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
                future: getNews(),
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
                        return CardFiles(
                          onDelete: () async {
                            var response =
                                await _curd.postRequest(linkFilesDelete, {
                              "id": snapshot.data['data'][i]['files_id']
                                  .toString(),
                              "imagename": snapshot.data['data'][i]
                                      ['files_image']
                                  .toString(),
                            });

                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "home", (route) => false);
                          },
                          ontap: () {},
                          libmodel: LibModel.fromJson(snapshot.data['data'][i]),
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
