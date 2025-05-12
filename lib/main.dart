// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Curricula/add_cu.dart';
import 'package:leftapp_1/app/Curricula/curricula.dart';
import 'package:leftapp_1/app/Informations/college_info/about.dart';
import 'package:leftapp_1/app/Informations/college_info/edit.dart';
import 'package:leftapp_1/app/Informations/home_page.dart';
import 'package:leftapp_1/app/Informations/team_info/about.dart';
import 'package:leftapp_1/app/Informations/team_info/add.dart';
import 'package:leftapp_1/app/Informations/team_info/edit.dart';
import 'package:leftapp_1/app/alerts/add_alerts.dart';
import 'package:leftapp_1/app/alerts/alerts_page.dart';
import 'package:leftapp_1/app/alerts/edit_alerts.dart';
import 'package:leftapp_1/app/auth/Users/singup.dart';
import 'package:leftapp_1/app/auth/about_app/about_app.dart';
import 'package:leftapp_1/app/auth/accounts.dart';
import 'package:leftapp_1/app/auth/login.dart';
import 'package:leftapp_1/app/auth/Admins/singup.dart';
import 'package:leftapp_1/app/home.dart';
import 'package:leftapp_1/app/libaray/add.dart';
import 'package:leftapp_1/app/libaray/library.dart';
import 'package:leftapp_1/app/news/add.dart';
import 'package:leftapp_1/app/news/edit.dart';
import 'package:leftapp_1/app/news/news.dart';
import 'package:leftapp_1/app/tables/add_tables.dart';
import 'package:leftapp_1/app/tables/table_page.dart';
import 'package:leftapp_1/app/tables/tables_edit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late SharedPreferences sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Main",
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // Arabic
      ],
      initialRoute: sharedpref.getString("id") == null ? "login" : "home",
      routes: {
        "login": (context) => Login(),
        "home": (context) => Home(),
        "addNews": (context) => AddNews(),
        "editNews": (context) => EditNews(),
        "library": (context) => Library(),
        "news": (context) => News(),
        "addfiles": (context) => AddFiles(),
        "cu": (context) => Curricula(),
        "addcu": (context) => AddCu(),
        "accounts": (context) => Accounts(),
        "Add_Accounts": (context) => SignUpApp(),
        "Add_Accounts_Us": (context) => SignUp_Us_App(),
        "info_page": (context) => home_page_info(),
        "info_coll": (context) => Info_coll(),
        "info_coll_edit": (context) => Edit_info(),
        "info_team": (context) => Info_Team(),
        "info_team_edit": (context) => Edit_info_team(),
        "info_team_add": (context) => Add_team(),
        "about_app": (context) => App(),
        "tables": (context) => Tables(),
        "tab_add": (context) => Add_tab(),
        "edit_tab": (context) => Edit_tables(),
        "alerts": (context) => Alerts(),
        "add_alerts": (context) => Add_alerts(),
        "edit_alerts": (context) => Edit_Alerts(),

        

        
      },
    );
  }
}
