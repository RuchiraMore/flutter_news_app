import 'package:rxdart/rxdart.dart';

abstract class BaseUsecase<T, Params>{
  Observable<T> buildUsecaseObservable({Params params});
}