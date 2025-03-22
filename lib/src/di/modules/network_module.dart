import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/constants/api.dart';

@module
abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @factoryMethod
  Dio provideDio() {
    final dio = Dio();
    dio
      // ..options.baseUrl = ApiConstant.baseUrl
      ..options.connectTimeout =
          const Duration(seconds: ApiConstant.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(seconds: ApiConstant.receiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        error: true,
      ));
    return dio;
  }
}
