import 'package:dio/dio.dart';
import 'dart:io';

class HttpUtil {
  final HOST = "127.0.0.1";
// or new Dio with a BaseOptions instance.
  var dio = Dio(BaseOptions(
    baseUrl: 'http://httpbin.org/',
    connectTimeout: 5000,
    receiveTimeout: 100000,
    // 5s
    headers: {
      HttpHeaders.userAgentHeader: 'dio',
      'api': '1.0.0',
    },
    contentType: Headers.jsonContentType,
    // Transform the response data to a String encoded with UTF8.
    // The default value is [ResponseType.JSON].
    responseType: ResponseType.plain,
  ));


  void getHttp() async {
    try {
      var response = await dio.get('http://www.google.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }
}