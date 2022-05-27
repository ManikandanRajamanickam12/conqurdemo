import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:conqur/app/build_config.dart';
import 'package:conqur/helpers/Network/CustomException.dart';
import 'package:conqur/helpers/Network/EndPoint.dart';
import 'package:conqur/helpers/utils/extensions.dart';
import 'package:conqur/helpers/utils/shared_preference.dart';
import 'package:dio/dio.dart';

const String DEFAULT_AUTHTOKEN =
    "Token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjQ1MzgyNjMsImlhdCI6MTU5MzAwMjI2MywidG9rZW4iOiI1NTFkMWJjMS1iOTQ4LTQ4N2MtODgwOC1lOWRmNjYzODk2NDEifQ.JphkICykzMIiEBNty_urvBHG4CZUA6RVoceyZ51C3y0";

const String DEFAULT_AUTHTOKEN_OTHER =
    "Token eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2MjkxMTY3MTEsImlhdCI6MTU5NzU4MDcxMSwidG9rZW4iOiIzNGNjM2Q3My1jZTdmLTRkOTgtOTljNy1mYmU1MDg5NmZlOTcifQ.Z8LZ3mL_OmgrK2jkAyNV2oOxZEqqf-pFHvv7RgRNYlQ";

class NetworkManager {
  static final _client = NetworkManager._internal();

  Dio? dio;

  BaseOptions? options;

  NetworkManager._internal();

  factory NetworkManager() => _client;

  Future<Response<T>> get<T>(
      {required EndPoint endPoint, String? resourcePath}) async {
    if (dio == null) initDio();

    var path = endPoint.url;
    if (resourcePath != null) {
      path += "${resourcePath}";
    }
    RequestOptions options = getDefaultRequestOptions(path);

    Log.d("===========API URL==========\n${options.uri.toString()}");
    Log.d("==========HEADERS=========\n${options.headers.toString()}");
    return await dio!.get(path, options: options.options);
  }

  Future<Response<T>> postData<T>({
    required EndPoint endPoint,
    required Map<String, dynamic> data,
  }) async {
    if (dio == null) await initDio();
    RequestOptions options = getDefaultRequestOptions(endPoint.url);

    Log.d("===========API URL==========\n${options.uri.toString()}");
    Log.d("==========HEADERS=========\n${options.headers.toString()}");
    Log.d("===========INPUT PARAMETERS==========\n${data.toString()}");
    var post = dio!.post<T>(endPoint.url,
        data: json.encode(data), options: options.options);
    return post;
  }

  Future<Response<T>> updateData<T>(
      {required EndPoint endPoint,
      required Map<String, dynamic> data,
      String? resourcePath}) async {
    if (dio == null) await initDio();

    var path = endPoint.url;
    if (resourcePath != null) {
      path += "/${resourcePath}";
    }

    RequestOptions options = getDefaultRequestOptions(path);

    print("===========API URL==========\n${options.uri.toString()}");
    Log.d("==========HEADERS=========\n${options.headers.toString()}");
    print("===========INPUT PARAMETERS==========\n${data.toString()}");

    return dio!.put(path, data: json.encode(data), options: options.options);
  }

  Future<Response<T>> deleteAuthData<T>(
      {required EndPoint endPoint, String? resourcePath}) async {
    if (dio == null) await initDio();

    var path = endPoint.url;
    if (resourcePath != null) {
      path += "/${resourcePath}";
    }
    RequestOptions options = getDefaultRequestOptions(path);

    print("===========API URL==========\n${options.uri.toString()}");
    Log.d("==========HEADERS=========\n${options.headers.toString()}");
    return dio!.delete(path, options: options.options);
  }

  Future<Response<T>> postAuthFileData<T>({
    required EndPoint endPoint,
    required FormData formData,
    String? resourcePath,
  }) async {
    if (dio == null) await initDio();
    var path = endPoint.url;
    if (resourcePath != null) {
      path += "?${resourcePath}";
    }

    RequestOptions options = getDefaultRequestOptions(path);
    return dio!.put(path, data: formData, options: options.options);
  }

  Future<void> initDio() async {
    options = BaseOptions(
        baseUrl: DEV_URL,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        headers: {
          'token': StorageManager.getJwtToken(),
        });
    dio = Dio(options);
    dio!.interceptors.add(InterceptorsWrapper(
      onError: onDioError,
      onResponse: onDioResponse,
    ));

    ///TODO: Add these parameters for deployment
    // if (kReleaseMode) {
    //   dio!.interceptors.add(HttpFormatter(logger: Log));
    // }
  }

  /// Interceptor handler for DIO error Callbacks, This will
  /// check if the API is passing status code [401],
  /// if true, function adds timeoutModel to Stream to show dialog to login again.
  void onDioError(DioError dioError, ErrorInterceptorHandler handler) {
    THttpException e = THttpException.from(
        dioError.response?.data, dioError.response!.statusCode!);
    if (dioError.response!.statusCode! == HttpStatus.unauthorized) {
      // dio!.interceptors.requestLock.lock();
      // dio!.interceptors.responseLock.lock();

      ///TODO: Implement Session Timeout
      // TranquilAppData()
      //     .sessionTimeoutEvent
      //     .add(SessionTimeOutModel(e.code, "account is deactivated"));
    }
    handler.next(dioError);
  }

  void onDioResponse(Response<dynamic> e, ResponseInterceptorHandler handler) {
    if (e.statusCode! == HttpStatus.unauthorized) {
      // dio!.interceptors.requestLock.lock();
      // dio!.interceptors.responseLock.lock();

      ///TODO: Implement Session Timeout
      // TranquilAppData()
      //     .sessionTimeoutEvent
      //     .add(SessionTimeOutModel(e.statusCode!, "account is deactivated"));
    }
    handler.next(e);
  }
}

String getAuthKey() {
  return StorageManager.getJwtToken() == null
      ? DEFAULT_AUTHTOKEN
      : StorageManager.getJwtToken()!;
}

RequestOptions getDefaultRequestOptions(String path) {
  return RequestOptions(
      baseUrl: DEV_URL,
      path: path,
      followRedirects: true,
      validateStatus: (status) {
        return status! < 500;
      },
      connectTimeout: 30000,
      receiveTimeout: 30000,
      headers: {
        'token': getAuthKey(),
      });
}

extension RequestOptionUtils on RequestOptions {
  Options get options {
    return Options(
      method: this.method,
      sendTimeout: this.sendTimeout,
      receiveTimeout: this.receiveTimeout,
      extra: this.extra,
      headers: this.headers,
      responseType: this.responseType,
      contentType: this.contentType,
      validateStatus: this.validateStatus,
      receiveDataWhenStatusError: this.receiveDataWhenStatusError,
      maxRedirects: this.maxRedirects,
      requestEncoder: this.requestEncoder,
      responseDecoder: this.responseDecoder,
      listFormat: this.listFormat,
    );
  }
}
