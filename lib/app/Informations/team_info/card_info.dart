// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/constant/linkapi.dart';
import 'package:leftapp_1/app/model/team_model.dart';

class Card_info_Team extends StatelessWidget {
  const Card_info_Team(
      {super.key,
      required this.ontap,
      required this.team_model,
      this.onDelete});

  final void Function() ontap;
  final Team_Model team_model;
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
              // مساحة الصورة
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "$linkimageRoot/${team_model.image}",
                    width: 100,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),
              // مساحة العنوان والنص
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(
                    "${team_model.name}",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.work, color: Colors.grey[700], size: 16),
                            SizedBox(width: 5),
                            Text(
                              "${team_model.section}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.description,
                                color: Colors.grey[700], size: 16),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                "${team_model.content}",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: onDelete,
                    icon: Icon(Icons.delete, color: Colors.redAccent),
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
