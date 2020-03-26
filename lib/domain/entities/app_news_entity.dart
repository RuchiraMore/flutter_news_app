import 'package:flutter_news_app/data/models/check_news_datasource_model.dart';

class News {

  List<ArticleList> articles;

  News({this.articles});

}

class ArticleList {

  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleList({this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});

}