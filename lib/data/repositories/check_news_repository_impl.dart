import 'package:flutter_news_app/data/datasource/check_news_datasource.dart';
import 'package:flutter_news_app/datasource/store/news_datastore.dart';
import 'package:flutter_news_app/domain/entities/app_news_entity.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';
import 'package:rxdart/rxdart.dart';

class CheckNewsRespositoryImpl extends CheckNewsRepository {

  final CheckNewsDatasource checkNewsRemoteDatasource;

  CheckNewsRespositoryImpl(this.checkNewsRemoteDatasource);

  @override
  Observable<News> getNewsList() {
    return checkNewsRemoteDatasource.getNewsList().map((datasourceModel){
      return News.mapToNewsEntity(datasourceModel);
    });
  }

}