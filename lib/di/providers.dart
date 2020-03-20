import 'package:flutter_base_architecture/data/local/sharedpreferences/user_stores.dart';
import 'package:flutter_base_architecture/exception/base_error_handler.dart';
import 'package:flutter_news_app/datasource/store/news_datastore.dart';
import 'package:flutter_news_app/domain/repositories/check_news_repository.dart';
import 'package:flutter_news_app/domain/usecases/check_news_usecase.dart';
import 'package:flutter_news_app/presentation/base/newsboard_baseview.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices
];

List<SingleChildCloneableWidget> uiConsumableProviders = [];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: NewsDatastore()),
  Provider.value(value: NewsboardErrorParser()),
  Provider.value(value: CheckNewsRepository()),
];

List<SingleChildCloneableWidget> dependentServices = [

  ProxyProvider<NewsboardErrorParser, ErrorHandler<NewsboardErrorParser>>(
    update: (context, errorParser, errorHandler) =>
        ErrorHandler<NewsboardErrorParser>(errorParser),
  ),

  ProxyProvider<NewsDatastore, UserStore>(
      update: (context, NewsDatastore, userStore) => userStore
  ),

  ProxyProvider<CheckNewsRepository, CheckNewsUsecase>(
    update: (context, inewsRepository, newsUseCase) =>
        CheckNewsUsecase(inewsRepository),
  ),

];