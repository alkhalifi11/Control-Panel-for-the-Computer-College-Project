// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, camel_case_types

class Accounts_UsModel {
  String? id;
  String? username;
  String? password;

  String? date;

  Accounts_UsModel(
      {this.id,
      this.username,
      this.password,

      this.date});

  Accounts_UsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['date'] = this.date;
    return data;
  }
}