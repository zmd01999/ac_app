import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:maple/http/response_base_model.dart';
import 'response_base_model.dart';
import 'LogInterceptors.dart';

class DioUtils {
  static var dio;
  static var httpUtil;

  static DioUtils get instance => _getInstance();
  static DioUtils _getInstance() {
    if (httpUtil == null) {
      httpUtil = DioUtils();
    }
    return httpUtil;
  }

  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 10000;

  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  ///Get请求
  static Future<dynamic> get <T>( {  required String url, parameters, Function(T? t)? onSuccess, Function(String error)? onError, }) async {
    try {
      return getResponse<T>(url: url, method : GET ,parameters: parameters, onSuccess: onSuccess, onError: onError);
    } catch (e) {
      print(e);
    }
  }

  ///Post请求 && put delect...
  static Future post<T>(
      { required String url,
        required String method,
        parameters,
        Function(T? t)? onSuccess,
        Function(String error)? onError,
      })  async {

    ///定义请求参数
    parameters = parameters ?? {};
   return getResponse(url: url, method: method, parameters: parameters, onSuccess: onSuccess, onError: onError);
  }

  static Future getResponse<T>({  required String url,
    required String method,
    parameters,
    Function(T? t)? onSuccess,
    Function(String error)? onError, }) async {
    try {
      Response response;
      Dio dio = createInstance();
      switch(method){
        case GET:
          response=  await dio.get(url, queryParameters: parameters);
          break;
        case PUT:
          response=  await dio.put(url, queryParameters: parameters);
          break;
        case PATCH:
          response=  await dio.patch(url, queryParameters: parameters);
          break;
        case DELETE:
          response=  await dio.delete(url, queryParameters: parameters);
          break;
        default:
          response=  await dio.post(url, data: parameters);
          break;
      }
      /// 拦截http层异常码
      if (response.statusCode == 200) {
        /// 这里做baseBena泛型解析，封装 并拦截后台code异常码，可拦截自定义处理
        ResponseBaseModel<T> bean = ResponseBaseModel.fromJson(response.data);
        if(bean.code==200 && onSuccess != null){
          /// 返回泛型Bean
          onSuccess(bean.data);
        }else{
          return bean.data == null ? bean.dataList : bean.data;
        }
      } else {
        throw Exception('statusCode:${response.statusCode}+${response.statusMessage}');
      }
    }
    catch (e) {
      print('请求出错：' + e.toString());
      throw Exception(e);
    }
  }
  /// @ url 请求链接
  ///@ parameters 请求参数
  ///@ metthod 请求方式
  ///@ onSuccess 成功回调
  ///@ onError 失败回调
  static Future<Map> request<T>(String url,
      {parameters,
        method,
        Function(T? t)? onSuccess,
        Function(String error)? onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    Dio dio = createInstance();
    //请求结果
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          var data = json.decode(response.data) ;
          onSuccess(data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError!(e.toString());
    }

    return result;
  }
  /// 初始化DIO
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
         baseUrl: "http://192.168.3.8:8080",
      );
      dio = new Dio(options);
      /// 增加拦截器并添加heands头 token
      dio.interceptors.add(LogInterceptors(dio));
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }

    return dio;
  }
  /// 清空 dio 对象
  clear() {
    dio = null;
  }
}
