// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, sort_child_properties_last, await_only_futures, camel_case_types

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class Edit_info_team extends StatefulWidget {
  final team;
  const Edit_info_team({super.key, this.team});

  @override
  State<Edit_info_team> createState() => _Edit_team_State();
}

class _Edit_team_State extends State<Edit_info_team> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController section = TextEditingController();
  TextEditingController des = TextEditingController();

  bool isLoding = false;
  File? myfile;
  String? types;

  editteam() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(linkEdit_Team, {
        "name": name.text,
        "content": content.text,
        "	image": image.text,
        "	type": type.text,
        "section": section.text,
        "des": des.text,
        "id": widget.team['id'].toString(),
      });
      isLoding = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed("home");
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
  void initState() {
    name.text = widget.team['name'];
    content.text = widget.team['content'];
    image.text = widget.team['image'];
    type.text = widget.team['type'];
    section.text = widget.team['section'];
    des.text = widget.team['des'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل معلومات الكادر "),
        centerTitle: true,
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
                        return validInput(val!, 1, 200);
                      },
                      mycontroller: name,
                      obscureText: false,
                      names: 'اسم الاستاذ ',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'منصب الاستاذ',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: section,
                      obscureText: false,
                      names: 'الدور',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: des,
                      obscureText: false,
                      names: 'المنصب',
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
                        await editteam();
                      },
                      child: Text("حفظ"),
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
