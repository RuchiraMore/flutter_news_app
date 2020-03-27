import 'package:flutter_base_architecture/data/local/sharedpreferences/user_stores.dart';
import 'package:flutter_base_architecture/exception/base_error_handler.dart';
import 'package:flutter_news_app/data/datasource/check_news_datasource.dart';
import 'package:flutter_news_app/data/repositories/check_news_repository_impl.dart';
import 'package:flutter_news_app/datasource/remote/api/news_rest_service.dart';
import 'package:flutter_news_app/datasource/remote/api/request/check_news_request.dart';
import 'package:flutter_news_app/datasource/remote/check_news_datastore_impl.dart';
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
  Provider.value(value: NewsRESTService()),

];

List<SingleChildCloneableWidget> dependentServices = [

  ProxyProvider<NewsboardErrorParser, ErrorHandler<NewsboardErrorParser>>(
    update: (context, errorParser, errorHandler) =>
        ErrorHandler<NewsboardErrorParser>(errorParser),
  ),

  ProxyProvider<NewsDatastore, UserStore>(
      update: (context, NewsDatastore, userStore) => userStore
  ),

  ProxyProvider<NewsRESTService,CheckNewsRequest>(
    update: (context,restService,newsRequest) =>
        CheckNewsRequest(restService),
  ),

  ProxyProvider<CheckNewsRequest,CheckNewsDatasource>(
    update: (context, newsRequest, iRemoteDatasource) =>
        CheckNewsDatasourceImpl(newsRequest),
  ),

  ProxyProvider<CheckNewsDatasource, CheckNewsRepository>(
    update: (context, iRemoteDatasource, iVersionRepository) =>
        CheckNewsRespositoryImpl(iRemoteDatasource),
  ),

  ProxyProvider<CheckNewsRepository, CheckNewsUsecase>(
    update: (context, inewsRepository, newsUseCase) =>
        CheckNewsUsecase(inewsRepository),
  ),

];