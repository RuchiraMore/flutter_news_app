//class NewsModel {
//    List<Article> articles;
//    String status;
//    int totalResults;
//
//    NewsModel({this.articles, this.status, this.totalResults});
//
//    factory NewsModel.fromJson(Map<String, dynamic> json) {
//        return NewsModel(
//            articles: json['articles'] != null ? (json['articles'] as List).map((i) => Article.fromJson(i)).toList() : null,
//            status: json['status'],
//            totalResults: json['totalResults'],
//        );
//    }
//
//    Map<String, dynamic> toJson() {
//        final Map<String, dynamic> data = new Map<String, dynamic>();
//        data['status'] = this.status;
//        data['totalResults'] = this.totalResults;
//        if (this.articles != null) {
//            data['articles'] = this.articles.map((v) => v.toJson()).toList();
//        }
//        return data;
//    }
//}
//
//class Article {
//    Object author;
//    String content;
//    String description;
//    String publishedAt;
//    Source source;
//    String title;
//    String url;
//    String urlToImage;
//
//    Article({this.author, this.content, this.description, this.publishedAt, this.source, this.title, this.url, this.urlToImage});
//
//    factory Article.fromJson(Map<String, dynamic> json) {
//        return Article(
//            author: json['author'] != null ? json['author'] : null,
//            content: json['content'],
//            description: json['description'],
//            publishedAt: json['publishedAt'],
//            source: json['source'] != null ? Source.fromJson(json['source']) : null,
//            title: json['title'],
//            url: json['url'],
//            urlToImage: json['urlToImage'],
//        );
//    }
//
//    Map<String, dynamic> toJson() {
//        final Map<String, dynamic> data = new Map<String, dynamic>();
//        data['content'] = this.content;
//        data['description'] = this.description;
//        data['publishedAt'] = this.publishedAt;
//        data['title'] = this.title;
//        data['url'] = this.url;
//        data['urlToImage'] = this.urlToImage;
//        if (this.author != null) {
//            data['author'] = this.author;
//        }
//        if (this.source != null) {
//            data['source'] = this.source.toJson();
//        }
//        return data;
//    }
//}
//
//class Source {
//    Object id;
//    String name;
//
//    Source({this.id, this.name});
//
//    factory Source.fromJson(Map<String, dynamic> json) {
//        return Source(
//            id: json['id'] != null ? json['id'] : null,
//            name: json['name'],
//        );
//    }
//
//    Map<String, dynamic> toJson() {
//        final Map<String, dynamic> data = new Map<String, dynamic>();
//        data['name'] = this.name;
//        if (this.id != null) {
//            data['id'] = this.id;
//        }
//        return data;
//    }
//}

//extension AppVersionDetailsDomainExt on AppVersionDetailsDomain {
//  AppVersionDetails mapToPresentation() => AppVersionDetails(
//      latest_version: this.latest_version,
//      legal_version: this.legal_version,
//      maintenance: this.maintenance,
//      min_version: this.min_version);
//}