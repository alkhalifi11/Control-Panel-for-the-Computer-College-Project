// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class LibModel {
  String? filesId;
  String? filesTitle;
  String? filesContent;
  String? filesDate;
  String? file;
  String? filesImage;
  String? tuner;

  LibModel(
      {this.filesId,
      this.filesTitle,
      this.filesContent,
      this.filesDate,
      this.file,
      this.filesImage,
      this.tuner});

  LibModel.fromJson(Map<String, dynamic> json) {
    filesId = json['files_id'];
    filesTitle = json['files_title'];
    filesContent = json['files_content'];
    filesDate = json['files_date'];
    file = json['file'];
    filesImage = json['files_image'];
    tuner = json['Tuner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['files_id'] = this.filesId;
    data['files_title'] = this.filesTitle;
    data['files_content'] = this.filesContent;
    data['files_date'] = this.filesDate;
    data['file'] = this.file;
    data['files_image'] = this.filesImage;
    data['Tuner'] = this.tuner;
    return data;
  }
}
