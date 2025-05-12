// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, avoid_single_cascade_in_expression_statements
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/main.dart';

class Add_alerts extends StatefulWidget {
  const Add_alerts({super.key});

  @override
  State<Add_alerts> createState() => _AddAlertsState();
}

class _AddAlertsState extends State<Add_alerts> {
  Curd _crud = Curd();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  bool isLoding = false;

  // تعديل دالة إضافة التنبيه لإزالة الصورة
  Add_alerts() async {
    if (formState.currentState!.validate()) {
      isLoding = true;
      setState(() {});
      var response = await _crud.postRequest(
        linkALAdd,
        {
          "title": title.text,
          "content": content.text,
          "id": sharedpref.getString("id"),
        },
      );
      isLoding = false;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("alerts", (route) => false);
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
                .pushNamedAndRemoveUntil("alerts", (route) => false);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "اضافة تنبية",
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
                      names: 'عنوان التنبية',
                      decision: false,
                    ),
                    SizedBox(height: 20),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 255);
                      },
                      mycontroller: content,
                      obscureText: false,
                      names: 'محتوئ التنبية',
                      decision: false,
                    ),
                    SizedBox(height: 20),
                    MaterialButton(
                      onPressed: () async {
                        await Add_alerts();
                      },
                      child: Text("رفع التنبية"),
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
