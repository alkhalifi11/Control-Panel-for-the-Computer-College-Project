// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class AccountsModel {
  String? id;
  String? name;
  String? username;
  String? password;
  String? date;

  AccountsModel(
      {this.id, this.name, this.username, this.password, this.date});

  AccountsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    password = json['password'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['password'] = this.password;
    data['date'] = this.date;
    return data;
  }
}
