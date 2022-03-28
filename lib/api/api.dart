import 'package:maple/http/dio_utils.dart';
import '../src/entity/user/user_entity.dart';
class Api {
  static const String baseUrl = 'http://localhost:8080';
  static Future<String?> login({required var data, required onSuccess, onError,}) async{
      return DioUtils.post<UserEntity>(url: '/api/v1/admin/login', method: 'post' , parameters: data, onSuccess: onSuccess, onError:onError).then((value) => null, onError: (e) => "账号或密码错误");
  }

}