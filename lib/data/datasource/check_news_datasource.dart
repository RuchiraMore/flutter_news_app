import 'package:flutter_news_app/domain/model/news_list_domain.dart';
import 'package:rxdart/rxdart.dart';

abstract class CheckNewsDatasource {
  Observable<NewsListDomain> getNewsList();
}