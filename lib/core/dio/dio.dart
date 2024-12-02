import 'package:dio/dio.dart';
import 'package:infinit_interview/core/dio/dio_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    return dio;
  }
}
