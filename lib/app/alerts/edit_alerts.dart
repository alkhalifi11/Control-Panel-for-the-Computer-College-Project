// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, sort_child_properties_last, await_only_futures

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class Edit_Alerts extends StatefulWidget {
  final alerts;
  const Edit_Alerts({super.key, this.alerts});

  @override
  State<Edit_Alerts> createState() => _EditAlertsState();
}

class _EditAlertsState extends State<Edit_Alerts> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  bool isLoding = false;

  editNews() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(linkALEdit, {
        "title": title.text,
        "content": content.text,
        "id": widget.alerts['id'].toString(),
      });
      isLoding = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context).pushReplacementNamed("alerts");
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
    title.text = widget.alerts['title'];
    content.text = widget.alerts['content'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل التنبية "),
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
                      names: 'عنوان التنبية',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'محتوئ التنبية',
                      decision: false,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        await editNews();
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
