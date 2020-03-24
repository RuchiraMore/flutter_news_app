import 'package:flutter_base_architecture/data/remote/request/rest_request.dart';
import 'package:flutter_base_architecture/data/remote/rest_service.dart';

abstract class NewsRequest extends RESTRequest {

  final RESTService service;

  NewsRequest(this.service) : super(service,apiUrl: '');

}
