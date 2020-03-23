import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:flutter_news_app/domain/usecases/check_news_usecase.dart';

class NewsboardViewmodel extends BaseViewModel {

  final CheckNewsUsecase checkNewsUsecase;
  NewsboardViewmodel(this.checkNewsUsecase) : super(busy:true);

  PageController _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  PageController get pageController => _pageController;

}