import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';

class CheckNewsUsecase {

  final CheckNewsRepository checkNewsRepository;
  CheckNewsUsecase(this.checkNewsRepository);

}