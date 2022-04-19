import 'dart:convert';

import 'package:maple/constant/constant.dart';
import 'package:maple/src/entity/user/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

//本地存储工具
class SharedPreferencesUtil {
  //token字符串
  static const String USER_HEAD = "user_head";
  static const String HEAD_PIC = "head_pic";


  static Future setUser(String userJson) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(USER_HEAD);
    sharedPreferences.setString(USER_HEAD, userJson);
  }

  static void clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  //获取token值
  static Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString(USER_HEAD);
    if (user == null) {
      return null;
    } else{
      return UserEntity.fromJson(jsonDecode(user)).token;
    }

  }

  static Future setCache(String key ,String str) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, str);
  }

  static Future<String?> getCache(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
  //获取呢称
  static Future<String?> getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString(USER_HEAD);
    if (user == null) {
      return null;
    } else{
      return UserEntity.fromJson(jsonDecode(user)).detail.nikename;
    }
  }

  static Future<UserDetail?> getUserDetail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? user = sharedPreferences.getString(USER_HEAD);
    if (user == null) {
      return null;
    } else{
      return UserEntity.fromJson(jsonDecode(user)).detail;
    }
  }

  // //获取头像url
  // static Future getImageHead() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   return sharedPreferences.get(KString.HEAD_URL);
  // }


}
