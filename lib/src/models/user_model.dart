import 'package:flutter_login/flutter_login.dart';
import 'package:quiver/core.dart';

class UserModel extends LoginData{
  UserModel({required String name, required String password}) : super(name: name, password: password);


  Map toJson() {
    Map map = new Map();
    map["name"] = this.name;
    map["password"] = this.password;
    return map;
  }
}