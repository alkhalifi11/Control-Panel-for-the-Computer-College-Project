// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_final_fields, use_build_context_synchronously, non_constant_identifier_names

// استيراد مكتبة Flutter الأساسية
import 'package:flutter/material.dart';
// استيراد صفحة حسابات الأدمن
import 'package:leftapp_1/app/auth/Admins/accounts_ad.dart';
// استيراد صفحة حسابات المستخدمين
import 'package:leftapp_1/app/auth/Users/accounts_us.dart';
// استيراد مكون القائمة الجانبية
import 'package:leftapp_1/app/components/Drawr.dart';
// استيراد مكون العمليات المساعدة
import 'package:leftapp_1/app/components/curd.dart';
// استيراد الروابط الثابتة
import 'package:leftapp_1/app/constant/linkapi.dart';

// تعريف صفحة StatefulWidget لإدارة الحسابات
class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _MyWidgetState();
}

// تعريف الحالة الخاصة بصفحة إدارة الحسابات
class _MyWidgetState extends State<Accounts> {
  // تعريف متغير لتحديد حالة التحميل
  bool isLoding = false;

  // تعريف كائن من نوع Curd لإجراء العمليات
  Curd _curd = Curd();

  // دالة لجلب بيانات حسابات الأدمن
  getAcc_Admin() async {
    // إرسال طلب POST لجلب البيانات
    var response = await _curd.postRequest(linkView_AD, {"id": 'id'});
    return response;
  }

  // دالة لجلب بيانات حسابات المستخدمين
  getAcc_Users() async {
    // إرسال طلب POST لجلب البيانات
    var response = await _curd.postRequest(linkView_US, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // بناء واجهة المستخدم باستخدام TabController
    return DefaultTabController(
        length: 2, // عدد التبويبات
        child: SafeArea(
            child: Scaffold(
          // تعريف شريط التطبيق
          appBar: AppBar(
            // إضافة خلفية متدرجة لشريط التطبيق
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF053661), Color(0xFF0A74DA)], // الألوان
                  begin: Alignment.topLeft, // بداية التدرج
                  end: Alignment.bottomRight, // نهاية التدرج
                ),
              ),
            ),
            toolbarHeight: 120, // ارتفاع شريط التطبيق
            iconTheme: IconThemeData(color: Colors.white), // لون الأيقونات
            title: Text(
              'ادارة الحسابات', // عنوان الصفحة
              style: TextStyle(
                  color: Colors.white, // لون النص
                  fontSize: 24, // حجم النص
                  fontWeight: FontWeight.w900), // سماكة النص
            ),
            centerTitle: true, // توسيط العنوان
            bottom: TabBar(
              labelColor: Colors.white, // لون النص المحدد
              unselectedLabelColor: Colors.white70, // لون النص غير المحدد
              tabs: [
                // تعريف التبويبة الأولى
                Tab(
                  icon: Icon(Icons.manage_accounts,
                      color: Colors.amber), // أيقونة التبويبة
                  text: "الادمن", // نص التبويبة
                ),
                // تعريف التبويبة الثانية
                Tab(
                  icon: Icon(Icons.supervised_user_circle_sharp,
                      color: Colors.lightGreen), // أيقونة التبويبة
                  text: "المستخدمين", // نص التبويبة
                ),
              ],
            ),
          ),
          drawer: drawerapp(), // إضافة القائمة الجانبية
          body: TabBarView(
            children: [
              Accounts_ad(), // محتوى التبويبة الأولى
              Accounts_us(), // محتوى التبويبة الثانية
            ],
          ),
        )));
  }
}
