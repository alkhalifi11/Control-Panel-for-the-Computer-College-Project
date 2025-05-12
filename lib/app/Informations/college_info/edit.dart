// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, sort_child_properties_last, await_only_futures, camel_case_types, non_constant_identifier_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class Edit_info extends StatefulWidget {
  final info;
  const Edit_info({super.key, this.info});

  @override
  State<Edit_info> createState() => _Edit_info_State();
}

class _Edit_info_State extends State<Edit_info> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController source = TextEditingController();

  bool isLoding = false;

  edit_info() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(linkEdit_info, {
        "title": title.text,
        "content": content.text,
        "source": source.text,
        "id": widget.info['id'].toString(),
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
    title.text = widget.info['title'];
    content.text = widget.info['content'];
    source.text = widget.info['source'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل المعلومات "),
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
                      names: 'عنوان الموضوع  ',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'نص الموضوع',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 0, 100);
                      },
                      mycontroller: source,
                      obscureText: false,
                      names: 'مصدر الموضوع',
                      decision: false,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await edit_info();
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
