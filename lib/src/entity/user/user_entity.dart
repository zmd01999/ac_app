import 'dart:convert';
import 'package:maple/generated/json/base/json_field.dart';
import 'package:maple/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {

	late String token;
	@JSONField(name: "Detail")
	late UserDetail detail;
  
  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDetail {

	late int id;
	late String username;
	late String password;
	late UserDetailRole role;
	late bool enabled;
	late bool accountNonLocked;
	late bool credentialsNonExpired;
	late bool accountNonExpired;
	late List<UserDetailAuthorities> authorities;
  
  UserDetail();

  factory UserDetail.fromJson(Map<String, dynamic> json) => $UserDetailFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDetailRole {

	late int id;
	late String roleName;
	late String roleNameZh;
  
  UserDetailRole();

  factory UserDetailRole.fromJson(Map<String, dynamic> json) => $UserDetailRoleFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailRoleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserDetailAuthorities {

	late String authority;
  
  UserDetailAuthorities();

  factory UserDetailAuthorities.fromJson(Map<String, dynamic> json) => $UserDetailAuthoritiesFromJson(json);

  Map<String, dynamic> toJson() => $UserDetailAuthoritiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}