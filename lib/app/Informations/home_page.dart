// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_final_fields, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/Informations/college_info/about.dart';
import 'package:leftapp_1/app/Informations/team_info/about.dart';
import 'package:leftapp_1/app/components/Drawr.dart';
import 'package:leftapp_1/app/components/curd.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';

class home_page_info extends StatefulWidget {
  const home_page_info({super.key});

  @override
  State<home_page_info> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<home_page_info> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_info() async {
    var response = await _curd.postRequest(linkView_info, {"id": 'id'});
    return response;
  }

  get_team() async {
    var response = await _curd.postRequest(linkView_Team, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF053661), Color(0xFF0A74DA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            toolbarHeight: 120,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'ادارة معلومات الكلية',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(
                  icon: Icon(Icons.info, color: Colors.amber),
                  text: "معلومات الكلية",
                ),
                Tab(
                  icon:
                      Icon(Icons.medical_information, color: Colors.lightGreen),
                  text: "معلومات الكادر",
                ),
              ],
            ),
          ),
          drawer: drawerapp(),
          body: TabBarView(
            children: [
              Info_coll(),
              Info_Team(),
            ],
          ),
        )));
  }
}
