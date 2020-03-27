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
            message: _responseDto?._message,
            type: BaseErrorType.SERVER_MESSAGE));
        return;
      }
      parseResponseData(_responseDto.data, super.apiIdenfier);
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
  bool _status;
  String _message = "";
  int _code;
  dynamic _data;

  bool get status => _status;
  String get message => _message;
  int get code => _code;
  dynamic get data => _data;

  NewsResponseDto(this._status, this._message, this._code, this._data);

  NewsResponseDto.map(dynamic obj, int statusCode) {
    this._status = obj["success"];
    this._message = obj["message"];
    this._code = statusCode; //200;//obj["code"];
    this._data = obj["data"];
    //this._errors = obj["errors"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["success"] = _status;
    map["message"] = _message;
    map["code"] = _code;
    map["data"] = _data;
    //map["error"] = _errors;
    return map;
  }
}