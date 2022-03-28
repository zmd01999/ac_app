import 'package:domus/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

//本地存储工具
class SharedPreferencesUtil {
  //token字符串
  static const String TOKEN = "uer_token";
  //获取token值
  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(TOKEN);
  }

  static Future setToken(String newToken) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(TOKEN, newToken);

  }
  // //获取头像url
  // static Future getImageHead() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.get(KString.HEAD_URL);
  // }
  // //获取呢称
  // static Future getUserName() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.get(KString.NICK_NAME);
  // }
}
