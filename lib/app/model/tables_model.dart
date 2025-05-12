// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, camel_case_types

class Tables_Model {
  String? id;
  String? title;
  String? image;
  String? type;
  String? date;

  Tables_Model({this.id, this.title, this.image, this.type, this.date});

  Tables_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['type'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['type'] = this.type;
    data['date'] = this.date;
    return data;
  }
}