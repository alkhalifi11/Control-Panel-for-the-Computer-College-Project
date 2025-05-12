// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, avoid_single_cascade_in_expression_statements

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/main.dart';

class AddNews extends StatefulWidget {
  const AddNews({super.key});

  @override
  State<AddNews> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController source = TextEditingController();

  bool isLoding = false;
  File? myfile;
  String? types;

  // ignore: non_constant_identifier_names
  AddNews() async {
    if (myfile == null) {
      AwesomeDialog(
          context: context,
          title: "هااام",
          body: Text("الرجاء اضافة الصورة الخاصة بالخبر"))
        ..show();
      return;
    }
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequestwithFile(
          linkAdd,
          {
            "news_title": title.text,
            "news_content": content.text,
            "news_type": types == "ki"
                ? '0'
                : types == "un"
                    ? '1'
                    : '2',
            "source": source.text,
            "id": sharedpref.getString("id"),
          },
          myfile!);
      isLoding = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "تنبية",
            body: Text("حدث خطأ ما .. يرجئ اعادة المحاولة مرة اخرئ"))
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 5, 54, 97),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("home", (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "اضافة خبر",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoding
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formState,
                child: ListView(
                  children: [
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 100);
                      },
                      mycontroller: title,
                      obscureText: false,
                      names: 'عنوان الخبر',
                      decision: false,
                    ),
                    SizedBox(height: 20),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 255);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'محتوئ الخبر',
                      decision: false,
                    ),
                    SizedBox(height: 20),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 255);
                      },
                      mycontroller: source,
                      obscureText: false,
                      names: 'مصدر الخبر',
                      decision: false,
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "الكلية",
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            Radio(
                                activeColor: Colors.blue,
                                value: "ki",
                                groupValue: types,
                                onChanged: (value) {
                                  setState(() {
                                    types = value;
                                  });
                                }),
                          ],
                        ),
                        Column(
                          children: [
                            Text("الجامعة",
                                style: TextStyle(fontWeight: FontWeight.w900)),
                            Radio(
                                activeColor: Colors.blue,
                                value: "un",
                                groupValue: types,
                                onChanged: (value) {
                                  setState(() {
                                    types = value;
                                  });
                                }),
                          ],
                        ),
                        Column(
                          children: [
                            Text("عامة",
                                style: TextStyle(fontWeight: FontWeight.w900)),
                            Radio(
                                activeColor: Colors.blue,
                                value: "all",
                                groupValue: types,
                                onChanged: (value) {
                                  setState(() {
                                    types = value;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  color: Colors.white,
                                  height: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "الرجاء اختيار صورة من:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              XFile? xfile = await ImagePicker()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              if (xfile != null) {
                                                setState(() {
                                                  myfile = File(xfile.path);
                                                });
                                              }
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.camera),
                                            label: Text("الكاميرا"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                          ),
                                          ElevatedButton.icon(
                                            onPressed: () async {
                                              XFile? xfile = await ImagePicker()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (xfile != null) {
                                                setState(() {
                                                  myfile = File(xfile.path);
                                                });
                                              }
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(Icons.photo),
                                            label: Text("المعرض"),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      child: Text("اضافة صورة"),
                      textColor: Colors.white,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () async {
                        await AddNews();
                      },
                      child: Text("رفع الخبر"),
                      textColor: Colors.white,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
