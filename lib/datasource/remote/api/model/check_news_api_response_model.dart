import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';

class CheckNewsApiModel {
  Data data;
  String status;

  CheckNewsApiModel({this.data, this.status});

  factory CheckNewsApiModel.fromJson(Map<String, dynamic> json) {
    return CheckNewsApiModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['`data`'] = this.data.toJson();
    }
    return data;
  }
}

class Data {

  List<Article> articles;

  Data({this.articles});

  factory Data.fromJson(Map<String,dynamic> json) {
    return Data(
      articles: json['articles'],
    );
  }

  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['articles'] = this.articles;

    return data;
  }
}