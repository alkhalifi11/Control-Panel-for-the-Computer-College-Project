// ignore_for_file: prefer_final_fields, prefer_typing_uninitialized_variables, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, sort_child_properties_last, await_only_futures

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class EditNews extends StatefulWidget {
  final news;
  const EditNews({super.key, this.news});

  @override
  State<EditNews> createState() => _EditNewsState();
}

class _EditNewsState extends State<EditNews> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController source = TextEditingController();

  bool isLoding = false;

  editNews() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(linkEdit, {
        "news_title": title.text,
        "news_content": content.text,
        "news_source": source.text,
        "news_id": widget.news['news_id'].toString(),
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
    title.text = widget.news['news_title'];
    content.text = widget.news['news_content'];
    source.text = widget.news['news_source'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل الخبر "),
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
                      names: 'عنوان الخبر',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'محتوئ الخبر',
                      decision: false,
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 5000);
                      },
                      mycontroller: source,
                      obscureText: false,
                      names: 'مصدر الخبر',
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
