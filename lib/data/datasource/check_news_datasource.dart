import 'package:flutter_news_app/data/models/check_news_datasource_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class CheckNewsDatasource {
  Observable<CheckNewsDatasourceModel> getNewsList();
}