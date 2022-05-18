import 'package:conqur/helpers/Network/CustomException.dart';

class PaginatedLoading {}

class PaginatedError {}

class PaginatedRetry {}

class PaginatedEmpty {}

abstract class BlocEvent {}

abstract class BlocState {
  BlocState({this.exception});

  THttpException? exception;
}

abstract class BlocBase {
  void dispose();
}
