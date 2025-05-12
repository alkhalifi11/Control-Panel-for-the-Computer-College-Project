// تجاهل بعض التحذيرات المتعلقة بالأفضلية في كتابة الكود
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, unused_field, use_build_context_synchronously, avoid_single_cascade_in_expression_statements

// استيراد مكتبة AwesomeDialog لعرض الحوارات
import 'package:awesome_dialog/awesome_dialog.dart';
// استيراد مكتبة Flutter الأساسية
import 'package:flutter/material.dart';
// استيراد مكون العمليات المساعدة
import 'package:leftapp_1/app/components/curd.dart';
// استيراد مكون الحقول النصية المخصصة
import 'package:leftapp_1/app/components/customtextform.dart';
// استيراد مكون التحقق من صحة الإدخال
import 'package:leftapp_1/app/components/valid.dart';
// استيراد الروابط الثابتة
import 'package:leftapp_1/app/constant/linkapi.dart';
// استيراد الملف الرئيسي للتطبيق
import 'package:leftapp_1/main.dart';

// تعريف صفحة StatefulWidget لتسجيل الدخول
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// تعريف الحالة الخاصة بصفحة تسجيل الدخول
class _LoginState extends State<Login> {
  // تعريف مفتاح النموذج للتحقق من صحة الإدخال
  GlobalKey<FormState> fromstate = GlobalKey();

  // تعريف بيانات الحقول المطلوبة من المستخدم إدخالها
  TextEditingController username = TextEditingController(); // اسم المستخدم
  TextEditingController password = TextEditingController(); // كلمة المرور

  // تعريف كائن من نوع Curd لإجراء العمليات
  Curd _curd = Curd();

  // دالة تسجيل الدخول
  loginApp() async {
    // التحقق من صحة الإدخال
    if (fromstate.currentState!.validate()) {
      // إرسال طلب POST لتسجيل الدخول
      var response = await _curd.postRequest(
          linkLogin, {"username": username.text, "password": password.text});
      // التحقق من حالة الاستجابة
      if (response['status'] == "success") {
        // تخزين بيانات المستخدم في SharedPreferences
        sharedpref.setString("id", response['data']['id'].toString());
        sharedpref.setString("username", response['data']['username']);
        // الانتقال إلى الصفحة الرئيسية
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        // عرض رسالة خطأ باستخدام AwesomeDialog
        AwesomeDialog(
            context: context,
            title: "تنبية", // عنوان الرسالة
            body: Text(
                "البريد الالكتروني او كلمة المرور غير صحيحة... يرجئ المحاولة مرة اخرئ")) // نص الرسالة
          ..show(); // عرض الحوار
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 255, 255, 255), // لون الخلفية
        body: Form(
          key: fromstate, // ربط النموذج بالمفتاح
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(10), // الهوامش
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // محاذاة العناصر
                  children: [
                    Image(
                      image: AssetImage("images/univ.jpeg"), // صورة الشعار
                      width: 300, // عرض الصورة
                      height: 300, // ارتفاع الصورة
                      fit: BoxFit.cover, // طريقة عرض الصورة
                    ),
                    Text(
                      "تسجيل الدخول", // نص العنوان
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25), // تنسيق النص
                    ),
                    SizedBox(
                      height: 40, // مسافة بين العناصر
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 50); // التحقق من صحة الإدخال
                      },
                      names: 'اسم المستخدم', // نص الحقل
                      mycontroller: username, // ربط الحقل بالمتحكم
                      obscureText: false, // النص غير مخفي
                      decision: false, // عدم إظهار زر إظهار النص
                    ),
                    CustTextForm(
                      valid: (val) {
                        return validInput(val!, 7, 50); // التحقق من صحة الإدخال
                      },
                      names: 'كلمة المرور', // نص الحقل
                      mycontroller: password, // ربط الحقل بالمتحكم
                      decision: true, // إظهار زر إظهار النص
                      obscureText: true, // النص مخفي
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 70), // الحواف الداخلية
                      color: Colors.blue, // لون الزر
                      textColor: Colors.white, // لون النص
                      onPressed: () async {
                        await loginApp(); // استدعاء دالة تسجيل الدخول
                      },
                      child: Text(
                        "تسجيل الدخول", // نص الزر
                        style: TextStyle(
                            fontWeight: FontWeight.w900), // تنسيق النص
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
