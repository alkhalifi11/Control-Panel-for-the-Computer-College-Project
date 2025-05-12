// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names

class CollegeModel {
  String? Id;
  String? Title;
  String? Content;
  String? Image;
  String? Date;
  String? Type;
  String? Source;

  CollegeModel({
    this.Id,
    this.Title,
    this.Content,
    this.Image,
    this.Date,
    this.Type,
    this.Source,
  });

  CollegeModel.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Title = json['title'];
    Content = json['content'];
    Image = json['image'];
    Date = json['date'];
    Type = json['type'];
    Source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data['title'] = this.Title;
    data['content'] = this.Content;
    data['image'] = this.Image;
    data['date'] = this.Date;
    data['type'] = this.Type;
    data['source'] = this.Source;

    return data;
  }
}
