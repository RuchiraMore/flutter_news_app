import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/presentation/model/news_list_presentation_model.dart';
import 'package:rxdart/src/observables/observable.dart';

class NewsListDomain {

  List<Article> articles;

  NewsListDomain({this.articles});

  factory NewsListDomain.fromJson(Map<String, dynamic> json) {
    return NewsListDomain(
      articles: json['articles'] != null ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList() : null,
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

//class ArticleList {
//
//  String author;
//  String title;
//  String description;
//  String url;
//  String urlToImage;
//  String publishedAt;
//  String content;
//
//  ArticleList({this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});
//
//  factory ArticleList.fromJson(Map<String, dynamic> json) {
//    return ArticleList(
//      author: json['author'] != null ? json['author'] : null,
//      content: json['content'],
//      description: json['description'],
//      publishedAt: json['publishedAt'],
//      title: json['title'],
//      url: json['url'],
//      urlToImage: json['urlToImage'],
//    );
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['content'] = this.content;
//    data['description'] = this.description;
//    data['publishedAt'] = this.publishedAt;
//    data['title'] = this.title;
//    data['url'] = this.url;
//    data['urlToImage'] = this.urlToImage;
//    if (this.author != null) {
//      data['author'] = this.author;
//    }
//
//    return data;
//  }
//}

extension NewsListDomainExt on NewsListDomain {

  NewsListPresentationModel mapToPresentation() => NewsListPresentationModel(articles: this.articles);
}

//extension ArticleListExt on ArticleList {
//  ArticleListP mapToPresentation() => ArticleListP(
//      author:this.author,
//      title:this.title,
//      description:this.description,
//      url:this.url,
//      urlToImage:this.urlToImage,
//      publishedAt:this.publishedAt,
//      content:this.content
//  );
//}
//
//
//extension ResultNewsListEntityExt on List<ArticleList> {
//  List<ArticleListP> mapToPresentation() => this.map((e) {
//    return e.mapToPresentation();
//  }).toList();
//}