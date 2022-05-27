import 'dart:io';

import 'package:dio/dio.dart';

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([message])
      : super(message, "Error During Communication: ");
}

class InternalServerException extends CustomException {
  InternalServerException([message])
      : super(message, "Internal Server error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}

class THttpException implements Exception {
  String? error;
  String detail;
  int code;
  String? codeStr;
  dynamic errType;

  THttpException(
      {this.error,
      required this.detail,
      required this.code,
      this.errType,
      this.codeStr});

  @override
  String toString() {
    if (detail == null) return "Exception Occured";
    return "$code -- $error  -- $errType -- $detail";
  }

  factory THttpException.info({required String message}) {
    return THttpException(code: 200, detail: message);
  }

  factory THttpException.error({required String message}) {
    return THttpException(code: 400, detail: message);
  }

  factory THttpException.from(dynamic jsonData, int statusCode) {
    if (jsonData is Map) {
      return THttpException(
          code: statusCode,
          detail: jsonData['detail'],
          codeStr: jsonData["code"]);
    }
    return THttpException(code: statusCode, detail: "error unknown");
  }

  factory THttpException.fromException(Exception error) {
    switch (error.runtimeType) {
      case DioError:
        return THttpException.fromDio(error as DioError);
      case OSError:
        return THttpException(
            error: error.toString(), detail: "os error", code: 400);
      case SocketException:
        return THttpException(
            error: error.toString(),
            detail:
                "There seems to problem with internet connection, please check your network connection and try again.",
            code: 400);
      case THttpException:
        return error as THttpException;
      default:
    }
    return THttpException(
        error: error.toString(), detail: "unknown error", code: 400);
  }

  factory THttpException.fromDio(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return THttpException(
            error: error.message, detail: "API timeout", code: 400);
      case DioErrorType.sendTimeout:
        return THttpException(
            error: error.message, detail: "API send timeout", code: 400);
      case DioErrorType.receiveTimeout:
        return THttpException(
            error: error.message, detail: "API receive timeout", code: 400);
      case DioErrorType.response:
        String err = "";
        if (error.response != null && error.response!.data is Map) {
          err = error.response!.data["detail"];
        } else {
          err = "Network error";
        }
        return THttpException(
            error: error.message,
            detail: err,
            code: error.response!.statusCode!);
      case DioErrorType.cancel:
        return THttpException(
            error: error.message, detail: "request cancelled", code: 400);
      default:
        String err = "";
        if (error.error != null) {
          if (error.error.runtimeType == SocketException) {
            err = "please check your network connection and try again";
          } else {
            err = error.error.toString();
          }
        } else {
          err = "Unknown error";
        }
        return THttpException(error: error.message, detail: err, code: 400);
    }
  }
}
