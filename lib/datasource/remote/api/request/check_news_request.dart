import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_news_app/datasource/remote/api/const_api_identifier.dart';
import 'package:flutter_news_app/datasource/remote/api/endpoints.dart';
import 'package:flutter_news_app/datasource/remote/api/request/news_request.dart';

class CheckNewsRequest extends NewsRequest {

  CheckNewsRequest(RESTService service) : super(service);

  Future<Response> apiGetNewsList(String country, String apiKey) async {

    Map<String,dynamic>parameters = Map();

//    parameters.putIfAbsent("country", () {
//      return country;
//    });

    parameters.putIfAbsent("apiKey", () {
      return apiKey;
    });

    return await execute(EndPoints.TOP_HEADLINES, parameters, RESTService.GET, ApiIdentifier.API_GET_NEWS);//ApiIdentifier.BASE_URL
  }

}
