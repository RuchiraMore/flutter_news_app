import 'package:dio/src/response.dart';
import 'package:flutter_news_app/data/models/check_news_datasource_model.dart';
import 'package:flutter_news_app/datasource/remote/api/response/news_response.dart';

class CheckNewsResponse extends NewsResponse<CheckNewsDatasourceModel>{

  CheckNewsResponse(Response response) : super(response);

  @override
  parseResponseData(dynamic dataArray, int apiIdentifier) {
    // TODO: implement parseResponseData
    throw UnimplementedError();
  }

}