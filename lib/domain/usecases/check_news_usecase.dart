import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';
import 'package:flutter_news_app/domain/usecases/base_usecase.dart';
import 'package:flutter_news_app/presentation/model/news_list_presentation_model.dart';
import 'package:rxdart/rxdart.dart';

class CheckNewsUsecase extends BaseUsecase<NewsListPresentationModel, CheckNewsUsecaseParams>{

  final CheckNewsRepository checkNewsRepository;
  CheckNewsUsecase(this.checkNewsRepository);

  Observable<NewsListPresentationModel> buildUsecaseObservable({
    CheckNewsUsecaseParams checkNewsUsecaseParams}) {

    return checkNewsRepository.getNewsList().asyncMap((appNewsResponse) {
      return appNewsResponse.mapToPresentation();
    });
  }
}

class CheckNewsUsecaseParams{
  CheckNewsUsecaseParams();
}