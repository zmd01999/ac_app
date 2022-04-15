import 'package:dio/dio.dart';
import 'package:maple/http/dio_utils.dart';
import 'package:maple/src/entity/home/weather_entity.dart';
import 'package:maple/src/entity/user/user_entity.dart';

class Api {
  static Future<String?> login({required var data, required onSuccess, onError,}) async{
      return DioUtils.post<UserEntity>(url: '/api/v1/admin/login', method: 'post' , parameters: data, onSuccess: onSuccess, onError:onError).then((value) => null, onError: (e) => "账号或密码错误");
  }

  static Future<String?> register({required var data, onSuccess, onError,}) async{
    return DioUtils.post<UserEntity>(url: '/api/v1/admin/register', method: 'post' , parameters: data, onSuccess: onSuccess, onError:onError).then((value) => null, onError: (e) => "注册失败");
  }
  static Future<WeatherEntity?> getWeather() async {
    var dio = new Dio();
    Map<String, String> data = {'key': 'fb24c421ffd6342bd3a360046d780cda', 'city': '430100'};
    Response response = await dio.get("https://restapi.amap.com/v3/weather/weatherInfo", queryParameters:data);
    WeatherEntity weatherEntity = WeatherEntity.fromJson(response.data);
    return weatherEntity;
  }



}