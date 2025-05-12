// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:leftapp_1/main.dart';

class drawerapp extends StatelessWidget {
  const drawerapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: null,
          ),
          ListTile(
            leading: Icon(Icons.folder_outlined),
            title: Text(
              "ادارة المحتوئ",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("home", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.supervised_user_circle_rounded),
            title: Text(
              "ادارة الحسابات",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("accounts", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text(
              "الجداول الدراسية",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("tables", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text(
              "بيانات عن الكلية",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("info_page", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_important_outlined),
            title: Text(
              "ادارة التنبيهات",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              sharedpref.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("alerts", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title: Text(
              "حول التطبيق",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              sharedpref.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("about_app", (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              "تسجيل الخروج",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              sharedpref.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
