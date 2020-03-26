import 'package:dio/src/response.dart';
import 'package:flutter_base_architecture/exception/base_error.dart';
import 'package:flutter_news_app/data/models/check_news_datasource_model.dart';
import 'package:flutter_news_app/datasource/entity/app_news_list_entity.dart';
import 'package:flutter_news_app/datasource/remote/api/const_api_identifier.dart';
import 'package:flutter_news_app/datasource/remote/api/response/news_response.dart';

class CheckNewsResponse extends NewsResponse<CheckNewsDatasourceModel>{

  CheckNewsResponse(Response response) : super(response);

  @override
  parseResponseData(dynamic dataArray, int apiIdentifier) {
    switch(apiIdentifier){
      case ApiIdentifier.API_GET_NEWS :
        try{
          AppNewsListEntity newsEntity = AppNewsListEntity.fromJson(dataArray);
//          getData().add(newsEntity);
        }
        catch (e) {

          getErrors().add(BaseError(message: e));
        }
    }
  }

}