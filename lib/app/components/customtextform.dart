// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
// تصفحة انشاء حقل تسجيل يتم استدعاءه جاهز وقت الحاجة في اي مكان في التطبيق
import 'package:flutter/material.dart';

class CustTextForm extends StatelessWidget {
  // تعريف متغير الاسم الظاهر في الحقل ليتم استدعاءه في اي حقل في التطبيق

  final String names;
  final bool decision;
  // ظيفة الكود التالي هو حفظ البيانات التي يقوم المستخدم بادخالها والتحكم فيها
  final TextEditingController mycontroller;

  final String? Function(String?)? valid;
  const CustTextForm(
      {super.key,
      required this.mycontroller,
      this.valid,
      required bool obscureText,
      required this.names,
      required this.decision});

  @override
  Widget build(BuildContext context) {
    return Container(
      //اعطى مسافة بين الحقول بمقدار 10 درجات من الاسفل فقط
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: decision,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          labelText: names,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            //جعل الحقل دائري بمقدار 10 درجات
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
