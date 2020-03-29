import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:flutter_news_app/domain/usecases/check_news_usecase.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:flutter_news_app/presentation/model/news_list_presentation_model.dart';

class NewsboardViewmodel extends BaseViewModel {

  final CheckNewsUsecase checkNewsUsecase;
  NewsboardViewmodel(this.checkNewsUsecase) : super(busy:true);

  NewsListPresentationModel newsList;

  PageController _pageController = PageController(initialPage: 0,viewportFraction: 0.8);
  PageController get pageController => _pageController;

  void fetchNewsList({
  @required
  Function(NewsListPresentationModel presentationModel) onSuccess,
  Function(String message) onError}) async {

    setBusy(false);
    //notifyListeners();

    addCompositeDisposable(

      checkNewsUsecase.buildUsecaseObservable(
          params: CheckNewsUsecaseParams()
      ).listen((newsListData){

        this.newsList = newsListData;

        print('news list data in presentation model ->');

        setBusy(false);

      }, onError: (error) {
        setBusy(false);
        print('news loading error ->'+ error.toString());
        postError(NewsboardError(
          type: NewsboardErrorType.SERVER_ERROR_MESSAGE,
          message: error.toString(),
        ));
      }
      )
    );
  }

}