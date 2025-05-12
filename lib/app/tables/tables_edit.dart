// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, sort_child_properties_last, await_only_futures, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class Edit_tables extends StatefulWidget {
  final tables;
  const Edit_tables({super.key, this.tables});

  @override
  State<Edit_tables> createState() => _EditNewsState();
}

class _EditNewsState extends State<Edit_tables> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();

  bool isLoding = false;

  edit_table() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(linkTabEdit, {
        "title": title.text,
        "id": widget.tables['id'].toString(),
      });
      isLoding = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed("tables");
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
    title.text = widget.tables['title'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل بيانات الجدول "),
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
                      mycontroller: title,
                      obscureText: false,
                      names: 'عنوان الجدول',
                      decision: false,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await edit_table();
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
