// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_import

import 'package:flutter/material.dart';
import 'package:leftapp_1/app/model/lib_model.dart';

class CardFiles extends StatelessWidget {
  const CardFiles(
      {super.key, required this.ontap, this.onDelete, required this.libmodel});

  final void Function() ontap;
  final LibModel libmodel;
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
              // مساحة الصورة
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.picture_as_pdf,
                  size: 50,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(width: 20),
              // مساحة العنوان والنص
              Expanded(
                flex: 4,
                child: ListTile(
                  title: Text(
                    "${libmodel.filesTitle}",
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
                      "${libmodel.filesContent}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
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
