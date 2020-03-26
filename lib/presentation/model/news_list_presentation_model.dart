import 'package:flutter_news_app/domain/model/news_list_domain.dart';

class NewsListPresentationModel {

  List<ArticleListP> articles;
  NewsListPresentationModel({this.articles});

  factory NewsListPresentationModel.fromJson(Map<String, dynamic> json) {
    return NewsListPresentationModel(
      articles: json['articles'] != null ? (json['articles'] as List).map((i) => ArticleListP.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class ArticleListP {

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleListP({this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});

  factory ArticleListP.fromJson(Map<String, dynamic> json) {
    return ArticleListP(
      author: json['author'] != null ? json['author'] : null,
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    if (this.author != null) {
      data['author'] = this.author;
    }

    return data;
  }
}