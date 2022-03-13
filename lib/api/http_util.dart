import 'package:dio/dio.dart';

class HttpUtil {
  var dio;
  HttpUtil(){
    dio = Dio();
    dio.options.baseUrl = "http://127.0.0.1:8080";
    dio.interceptors.add(LogInterceptor(responseBody: true));

  }
}
