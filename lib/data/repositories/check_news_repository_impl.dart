import 'package:flutter_news_app/data/datasource/check_news_datasource.dart';
import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/domain/model/news_list_domain.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';
import 'package:rxdart/rxdart.dart';

class CheckNewsRespositoryImpl extends CheckNewsRepository {

  final CheckNewsDatasource checkNewsRemoteDatasource;

  CheckNewsRespositoryImpl(this.checkNewsRemoteDatasource);

  @override
  Observable<List<Article>> getNewsLists() {//NewsListDomain
    return checkNewsRemoteDatasource.getNewsLists();//getNewsList
  }

}