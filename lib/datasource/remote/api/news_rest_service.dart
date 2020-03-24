import 'package:flutter_base_architecture/data/remote/rest_service.dart';

class NewsRESTService extends RESTService {
  Map<String,dynamic> headers = Map<String,dynamic>();

  @override
  Map<String, dynamic> getHeaders() {
    return headers;
  }
}