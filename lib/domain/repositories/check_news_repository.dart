import 'package:flutter_news_app/domain/entities/app_news_entity.dart';
import 'package:rxdart/rxdart.dart';

abstract class CheckNewsRepository {
  Observable<News> getNewsList();
}