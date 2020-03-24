import 'package:dio/src/response.dart';
import 'package:flutter_base_architecture/data/remote/response/rest_response.dart';

abstract class NewsResponse<T> extends RESTResponse<T>{

  NewsResponse(Response response) : super(response);


}