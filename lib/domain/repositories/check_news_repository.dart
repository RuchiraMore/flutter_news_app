import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/domain/model/news_list_domain.dart';
import 'package:rxdart/rxdart.dart';

abstract class CheckNewsRepository {
  Observable<NewsListDomain> getNewsList();
}