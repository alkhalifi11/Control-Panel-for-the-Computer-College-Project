// ignore_for_file: prefer_final_fields, non_constant_identifier_names, prefer_const_constructors, avoid_single_cascade_in_expression_statements, use_build_context_synchronously, sort_child_properties_last, avoid_unnecessary_containers

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/main.dart';

class AddCu extends StatefulWidget {
  const AddCu({super.key});

  @override
  State<AddCu> createState() => _AddCuState();
}

class _AddCuState extends State<AddCu> {
  List<String> typelest = ['التخصص', 'CS', 'IT'];
  String? selectedtype = 'التخصص';

  List<String> levellest = ['المستوئ', 'الاول', 'الثاني', 'الثالث', 'الرابع'];
  String? selectedlevel = 'المستوئ';

  List<String> Chapterlest = ['الفصل', 'الاول', 'الثاني'];
  String? selectedChapter = 'الفصل';

  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController level = TextEditingController();
  TextEditingController chpater = TextEditingController();
  TextEditingController teacher = TextEditingController();

  bool isLoding = false;
  File? myfile;
  String? types;
  String? Items;
  String? Items2;
  String? Items3;

  AddCu() async {
    if (myfile == null) {
      AwesomeDialog(
          context: context, title: "هااام", body: Text("الرجاء اضافة ملف"))
        ..show();
    }

    if (formState.currentState!.validate()) {
      isLoding = false;
      setState(() {});
      var response = await _crud.postRequestwithFile(
          linkCuAdd,
          {
            "title": title.text,
            "content": content.text,
            "teacher": teacher.text,
            "type": Items,
            "level": Items2,
            "chapter": Items3,
            "id": sharedpref.getString("id"),
          },
          myfile!);
      isLoding = true;
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
        title: Text(
          "اضافة منهج جديد",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("home", (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(10),
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
                      names: 'عنوان المنهج',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 255);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'نوع المنهج',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 255);
                      },
                      mycontroller: teacher,
                      obscureText: false,
                      names: 'استاذ المنهج',
                      decision: false,
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "قم بتحديد التخصص المطلوب :",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //التخصص
                              DropdownButton<String>(
                                onTap: () {},
                                hint: Text('التخصص'),
                                value: selectedtype,
                                items: typelest
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => selectedtype = Items = item),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              //المستوى
                              DropdownButton<String>(
                                onTap: () {},
                                value: selectedlevel,
                                items: levellest
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(fontSize: 17),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (item) => setState(
                                    () => selectedlevel = Items2 = item),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              // الفصل
                              DropdownButton<String>(
                                onTap: () {},
                                value: selectedChapter,
                                items: Chapterlest.map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                  ),
                                ).toList(),
                                onChanged: (item) => setState(
                                    () => selectedChapter = Items3 = item),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          myfile = File(result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Text("اضافة ملف"),
                      textColor: Colors.white,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await AddCu();
                      },
                      child: Text("رفع الملف"),
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
