import 'package:flutter_base_architecture/data/remote/request/rest_request.dart';
import 'package:flutter_base_architecture/data/remote/rest_service.dart';
import 'package:flutter_news_app/datasource/remote/api/const_api_identifier.dart';
import 'package:dio/dio.dart';

abstract class NewsRequest extends RESTRequest {

  final RESTService service;

  NewsRequest(this.service) : super(service,apiUrl: ApiIdentifier.BASE_URL);

  @override
  Future<Response> execute(
      String endpoint,
      Map<String, dynamic> params,
      int apiCallMethod,
      int apiIdentifier,
      {Map<String,dynamic> headerParams, forceRefresh = false}){

    if (headerParams != null){
      service.getHeaders().addAll(headerParams);
    }

    return super.execute(endpoint, params, apiCallMethod, apiIdentifier);
  }

}
