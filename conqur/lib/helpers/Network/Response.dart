import 'CustomException.dart';

class ApiResponse<T> {
  Status status;

  T? data;

  THttpException? exception;

  ApiResponse() : status = Status.loading;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed(this.data) : status = Status.completed;

  ApiResponse.empty() : status = Status.noData;

  ApiResponse.custom(this.data, this.status);

  ApiResponse.error(String message)
      : status = Status.error,
        exception = THttpException(detail: message, code: 400);

  ApiResponse.exception(this.exception) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Data : $data";
  }
}

enum Status { loading, completed, error, noData }
