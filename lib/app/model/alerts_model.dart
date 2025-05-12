// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class Alerts_Model {
  String? Id;
  String? Title;
  String? Content;
  String? Date;


  Alerts_Model(
      {this.Id,
      this.Title,
      this.Content,
      this.Date,});

  Alerts_Model.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Title = json['title'];
    Content = json['content'];
    Date = json['date'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data['title'] = this.Title;
    data['content'] = this.Content;
    data['date'] = this.Date;

    return data;
  }
}
