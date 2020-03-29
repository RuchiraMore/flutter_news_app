import 'package:dio/src/response.dart';
import 'package:flutter_base_architecture/data/remote/response/rest_response.dart';
import 'package:flutter_base_architecture/exception/base_error.dart';

abstract class NewsResponse<T> extends RESTResponse<T>{

  NewsResponse(Response response) : super(response);

  @override
  parseEncryptedResponse(dynamic encryptedResponse) {
    return parseResponse(encryptedResponse);
  }

  @override
  parseResponse(Map<String, dynamic> response) {
    print("RESTResponse:: Decrypted: " + response.toString());
    Map<String, dynamic> responseObject = response;
    try {

      NewsResponseDto _responseDto =
      NewsResponseDto.map(responseObject, this.response.statusCode);

      if (_responseDto.code != 200) {
        getErrors().add(BaseError(
            message: _responseDto?._status,
            type: BaseErrorType.SERVER_MESSAGE));
        return;
      }

//      parseResponseData(_responseDto, super.apiIdenfier);

      parseResponseData(_responseDto.toMap(), super.apiIdenfier);

    } catch (error) {
      getErrors().add(BaseError(
          message: error.toString(),
          type: BaseErrorType.UNEXPECTED));
      print("RESTResponse:: Error---- " + error.toString());
    }
  }

  @override
  parseResponseData(dynamic data, int apiIdentifier) {

  }
}

class NewsResponseDto{
  String _status;
  int _totalResults = 0;
  int _code;
  dynamic _articles;
//  List<ArticleDto> _articles;


  String get status => _status;
  int get totalResults => _totalResults;
  int get code => _code;
  dynamic get articles => _articles;

  NewsResponseDto(this._status, this._totalResults, this._code, this._articles);

  NewsResponseDto.map(dynamic obj, int statusCode) {
    this._status = obj["status"];//["success"];
    this._totalResults = obj["totalResults"];
    this._code = statusCode; //200;//obj["code"];
    this._articles = obj["articles"];//["data"];
//    this._errors = obj["errors"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = _status;
    map["totalResults"] = _totalResults;
    map["code"] = _code;
    map["articles"] = _articles;
    //map["error"] = _errors;
    return map;
  }
}