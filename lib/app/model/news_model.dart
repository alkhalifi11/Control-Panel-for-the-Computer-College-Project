// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class NewsModel {
  String? newsId;
  String? newsTitle;
  String? newsContent;
  String? newsImage;
  String? newsDate;
  String? newsType;
  String? source;

  NewsModel(
      {this.newsId,
      this.newsTitle,
      this.newsContent,
      this.newsImage,
      this.newsDate,
      this.newsType,
      this.source});

  NewsModel.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    newsTitle = json['news_title'];
    newsContent = json['news_content'];
    newsImage = json['news_image'];
    newsDate = json['news_date'];
    newsType = json['news_type'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['news_title'] = this.newsTitle;
    data['news_content'] = this.newsContent;
    data['news_image'] = this.newsImage;
    data['news_date'] = this.newsDate;
    data['news_type'] = this.newsType;
    data['source'] = this.source;
    return data;
  }
}