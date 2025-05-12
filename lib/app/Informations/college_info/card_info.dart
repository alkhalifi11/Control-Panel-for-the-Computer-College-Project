// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/college_model.dart';

class Card_info_coll extends StatelessWidget {
  const Card_info_coll(
      {super.key,
      required this.ontap,
      required this.coll_model,
      this.onDelete});

  final void Function() ontap;
  final CollegeModel coll_model;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image area
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "$linkimageRoot/${coll_model.Image}",
                    width: 100,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              // Title and text area
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    "${coll_model.Title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "${coll_model.Content}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
