import 'dart:async';

import 'package:flutter_base_architecture/data/local/sharedpreferences/user_stores.dart';
import 'package:flutter_news_app/domain/entities/user.dart';

class NewsDatastore extends UserStore<User> {

  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  NewsDatastore(){
    getLoggedInUserJson();
  }

  @override
  User mapUserDto(json) {
    var userDto = User.fromJson(json);
    _userController.add(userDto);
    return userDto;
  }

}
