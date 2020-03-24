import 'package:flutter_news_app/data/datasource/check_news_datasource.dart';
import 'package:flutter_news_app/datasource/store/news_datastore.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';

class CheckNewsRespositoryImpl extends CheckNewsRepository {

  final CheckNewsDatasource checkNewsRemoteDatasource;

  CheckNewsRespositoryImpl(this.checkNewsRemoteDatasource);
}