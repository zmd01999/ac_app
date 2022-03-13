import 'package:dio/dio.dart';
import 'http_util.dart';
class Api {
  var dio = HttpUtil().dio;

  Future<Response> login(var data) async{
    return await dio.post('/api/v1/admin/login', data: data);
  }

}