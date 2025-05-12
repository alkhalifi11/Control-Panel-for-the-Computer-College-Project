// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, avoid_single_cascade_in_expression_statements, await_only_futures, sort_child_properties_last, non_constant_identifier_names, unused_import, unused_field, camel_case_types

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/components/customtextform.dart';
import 'package:leftapp_1/app/components/valid.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/news/add.dart';
import 'package:leftapp_1/main.dart';

class SignUp_Us_App extends StatefulWidget {
  const SignUp_Us_App({super.key});

  @override
  State<SignUp_Us_App> createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUp_Us_App> {
  GlobalKey<FormState> fromstate = GlobalKey();


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isDense = false;
  //
  Curd _curd = Curd();
  //
  AddAccounts() async {
    if (fromstate.currentState!.validate()) {
      isLoding = false;
      setState(() {});
      var response = await _curd.postRequest(
        linkSignuP_US,
        {
          "username": username.text,
          "password": password.text,
          "id": sharedpref.getString("id"),
        },
      );
      isLoding = true;
      setState(() {});

      if (response['status'] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("accounts", (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "تنبية",
            body: Text("حدث خطأ ما .. يرجئ اعادة المحاولة مرة اخرئ"))
          ..show();
      }
    }
  }

  bool isLoding = false;
  String? types;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 5, 54, 97),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("accounts", (route) => false);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "انشاء حساب",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 100,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: isLoding == true
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: fromstate,
                  child: ListView(
                    children: [
                      CustTextForm(
                        valid: (val) {
                          return validInput(val!, 1, 100);
                        },
                        mycontroller: username,
                        obscureText: false,
                        names: 'اسم المستخدم',
                        decision: false,
                      ),
                      CustTextForm(
                        valid: (val) {
                          return validInput(val!, 1, 255);
                        },
                        mycontroller: password,
                        obscureText: false,
                        names: 'كلمة المرور',
                        decision: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: MaterialButton(
                          onPressed: () async {
                            await AddAccounts();
                          },
                          child: Text(
                            "انشاء الحساب",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          textColor: Colors.white,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
