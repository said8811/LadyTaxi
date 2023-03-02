import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lady_taxi/data/api/location_api/custom_exception.dart';

class RegisterApiClient {
  RegisterApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://3.75.239.91:9000/v1/",
        connectTimeout: const Duration(seconds: 25000),
        receiveTimeout: const Duration(seconds: 20000),
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
        case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
        case DioErrorType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              throw BadRequestException(error.response?.data['message']);
            case 401:
              throw UnauthorizedException(error.requestOptions);
            case 404:
              throw NotFoundException(error.requestOptions);
            case 409:
              throw ConflictException(error.requestOptions);
            case 500:
            case 501:
            case 503:
              throw InternalServerErrorException(error.requestOptions);
          }
          break;
        case DioErrorType.cancel:
          break;
        default:
          throw NoInternetConnectionException(error.requestOptions);
      }
      return handler.next(error);
    }, onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return handler.next(response);
    }));
  }
}
