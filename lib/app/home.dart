// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_import, sort_child_properties_last, unused_local_variable, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Curricula/curricula.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/libaray/library.dart';
import 'package:leftapp_1/app/news/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white, size: 30),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF053661), Color(0xFF0A74DA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            title: Text(
              "لوحة التحكم",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(
                  icon: Icon(Icons.newspaper),
                  text: "الاخبار",
                ),
                Tab(
                  icon: Icon(Icons.book),
                  text: "المكتبة",
                ),
                Tab(
                  icon: Icon(Icons.library_books_sharp),
                  text: "المناهج",
                ),
              ],
            ),
          ),
          drawer: drawerapp(),
          body: TabBarView(
            children: [
              News(),
              Library(),
              Curricula(),
            ],
          ),
        ),
      ),
    );
  }
}
