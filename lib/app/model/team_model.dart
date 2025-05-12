// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Team_Model {
  String? id;
  String? name;
  String? content;
  String? image;
  String? type;
  String? section;
  String? des;

  Team_Model(
      {this.id,
      this.name,
      this.content,
      this.image,
      this.type,
      this.section,
      this.des});

  Team_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    image = json['image'];
    type = json['type'];
    section = json['section'];
    des = json['des'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['image'] = this.image;
    data['type'] = this.type;
    data['section'] = this.section;
    data['des'] = this.des;
    return data;
  }
}