
import 'package:dio/dio.dart';
import '../utils/shared_preferences_util.dart';

///日志拦截器
class LogInterceptors extends InterceptorsWrapper {
  Dio dio;

  LogInterceptors(this.dio);

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("========================请求数据===================");
    print("【请求baseUrl】${options.uri}");
//    print("【请求path】${options.path}");
//    print("【请求headers】${options.headers.toString()}");
    print("【请求参数】${options.data.toString()}");
    dio.lock();
    await SharedPreferencesUtil.getToken().then((token) {
      if(token==null||token.toString().isEmpty){
        return;
      }
      Map<String,String> parms = {"Authorization" : "Bearer "+token};
      options.headers.addAll(parms);
    });
    dio.unlock();
    return handler.next(options);
    // return super.onRequest(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("【返回statusCode】${response.statusCode}");
//    print("【返回headers】${response.headers.toString()}");
//    print("【返回extra】${response.extra.toString()}");
    print("【返回data】${response.data.toString()}");
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("========================请求错误===================");
    formatError(err);
    return handler.next(err);
  }

  ///  error统一处理
  void formatError(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      print(e.hashCode.toString() + "连接超时");
    } else if (e.type == DioErrorType.sendTimeout) {
      print(e.hashCode.toString() + "请求超时");
    } else if (e.type == DioErrorType.receiveTimeout) {
      print(e.hashCode.toString() + "响应超时");
    } else if (e.type == DioErrorType.response) {
      print(e.hashCode.toString() + "出现异常404 503");
    } else if (e.type == DioErrorType.cancel) {
      print(e.hashCode.toString() + "请求取消");
    } else {
      print("message =${e.message}");
    }
  }
}
