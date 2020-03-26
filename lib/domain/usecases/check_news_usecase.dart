import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:flutter_news_app/domain/entities/app_news_entity.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';
import 'package:flutter_news_app/presentation/model/check_news_presentation_model.dart';
import 'package:rxdart/rxdart.dart';

class CheckNewsUsecase {

  final CheckNewsRepository checkNewsRepository;
  CheckNewsUsecase(this.checkNewsRepository);

  Observable<CheckNewsPresentationModel> execute() {
    return checkNewsRepository.getNewsList().map((newsEntity) {
      return CheckNewsPresentationModel.mapToPresentation(newsEntity);
    });
  }
}