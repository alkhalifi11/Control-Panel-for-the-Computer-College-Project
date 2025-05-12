// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class CurriModel {
  String? id;
  String? title;
  String? content;
  String? file;
  String? type;
  String? level;
  String? chapter;
  String? date;
  String? teacher;

  CurriModel(
      {this.id,
      this.title,
      this.content,
      this.file,
      this.type,
      this.level,
      this.chapter,
      this.date,
      this.teacher});

  CurriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    file = json['file'];
    type = json['type'];
    level = json['level'];
    chapter = json['chapter'];
    date = json['date'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['file'] = this.file;
    data['type'] = this.type;
    data['level'] = this.level;
    data['chapter'] = this.chapter;
    data['date'] = this.date;
    data['teacher'] = this.teacher;
    return data;
  }
}
