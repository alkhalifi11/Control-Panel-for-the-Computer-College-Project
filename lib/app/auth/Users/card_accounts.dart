// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/model/us_model.dart';

class CardAccountsUers extends StatelessWidget {
  const CardAccountsUers(
      {super.key,
      required this.ontap,
      required this.accounts_model,
      this.onDelete});

  final void Function() ontap;
  final Accounts_UsModel accounts_model;
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
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image area
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.person_pin_rounded,
                  size: 50,
                  color: Colors.blueAccent,
                ),
              ),
              // Title and text area
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم المستخدم :  ${accounts_model.username}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "كلمة المرور :  ${accounts_model.password}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      
                    ],
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
