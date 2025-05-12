// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, avoid_single_cascade_in_expression_statements, non_constant_identifier_names, unused_local_variable, await_only_futures, unused_import

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/main.dart';


class AddFiles extends StatefulWidget {
  const AddFiles({super.key});

  @override
  State<AddFiles> createState() => _AddNewsState();
}

class _AddNewsState extends State<AddFiles> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController type = TextEditingController();

  bool isLoding = false;
  File? myfile;
  String? types;

  AddFiles() async {
    if (myfile == null) {
      AwesomeDialog(
          context: context, title: "هااام", body: Text("الرجاء اضافة ملف"))
        ..show();
    }
    
      if (formState.currentState!.validate()) {
        isLoding = false;
        setState(() {});
        var response = await _crud.postRequestwithFile(
            linkFilesAdd,
            {
              "files_title": title.text,
              "files_content": content.text,
              "files_type": '0',
              "id": sharedpref.getString("id"),
            },
            myfile!);
        isLoding = true;
        setState(() {});

        if (response['status'] == "success") {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("library", (route) => false);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 5, 54, 97),
          title: Text(
            "اضافة ملف",
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
                        names: 'عنوان الملف',
                        decision: false,
                      ),
                      CustTextForm(
                        valid: (val) {
                          return validInput(val!, 5, 255);
                        },
                        mycontroller: content,
                        obscureText: false,
                        names: 'محتوئ الملف',
                        decision: false,
                      ),
                      MaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                                  color: Colors.white,
                                  height: 200,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Text(
                                        " : الرجاء اختيار صورة من",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 22),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          XFile? xfile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          myfile = File(xfile!.path);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              " الكاميرا",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          XFile? xfile = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          myfile = File(xfile!.path);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              " المعرض",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                      },
                      child: Text("اضافة صورة"),
                      textColor: Colors.white,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: 20,
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
                          await AddFiles();
                        },
                        child: Text("رفع الملف"),
                        textColor: Colors.white,
                        color: Colors.blue,
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
