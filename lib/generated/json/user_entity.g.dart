import 'package:domus/generated/json/base/json_convert_content.dart';
import 'package:domus/src/entity/user/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userEntity.token = token;
	}
	final UserDetail? detail = jsonConvert.convert<UserDetail>(json['Detail']);
	if (detail != null) {
		userEntity.detail = detail;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['token'] = entity.token;
	data['Detail'] = entity.detail.toJson();
	return data;
}

UserDetail $UserDetailFromJson(Map<String, dynamic> json) {
	final UserDetail userDetail = UserDetail();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userDetail.id = id;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userDetail.username = username;
	}
	final String? password = jsonConvert.convert<String>(json['password']);
	if (password != null) {
		userDetail.password = password;
	}
	final UserDetailRole? role = jsonConvert.convert<UserDetailRole>(json['role']);
	if (role != null) {
		userDetail.role = role;
	}
	final bool? enabled = jsonConvert.convert<bool>(json['enabled']);
	if (enabled != null) {
		userDetail.enabled = enabled;
	}
	final bool? accountNonLocked = jsonConvert.convert<bool>(json['accountNonLocked']);
	if (accountNonLocked != null) {
		userDetail.accountNonLocked = accountNonLocked;
	}
	final bool? credentialsNonExpired = jsonConvert.convert<bool>(json['credentialsNonExpired']);
	if (credentialsNonExpired != null) {
		userDetail.credentialsNonExpired = credentialsNonExpired;
	}
	final bool? accountNonExpired = jsonConvert.convert<bool>(json['accountNonExpired']);
	if (accountNonExpired != null) {
		userDetail.accountNonExpired = accountNonExpired;
	}
	final List<UserDetailAuthorities>? authorities = jsonConvert.convertListNotNull<UserDetailAuthorities>(json['authorities']);
	if (authorities != null) {
		userDetail.authorities = authorities;
	}
	return userDetail;
}

Map<String, dynamic> $UserDetailToJson(UserDetail entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['username'] = entity.username;
	data['password'] = entity.password;
	data['role'] = entity.role.toJson();
	data['enabled'] = entity.enabled;
	data['accountNonLocked'] = entity.accountNonLocked;
	data['credentialsNonExpired'] = entity.credentialsNonExpired;
	data['accountNonExpired'] = entity.accountNonExpired;
	data['authorities'] =  entity.authorities.map((v) => v.toJson()).toList();
	return data;
}

UserDetailRole $UserDetailRoleFromJson(Map<String, dynamic> json) {
	final UserDetailRole userDetailRole = UserDetailRole();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userDetailRole.id = id;
	}
	final String? roleName = jsonConvert.convert<String>(json['roleName']);
	if (roleName != null) {
		userDetailRole.roleName = roleName;
	}
	final String? roleNameZh = jsonConvert.convert<String>(json['roleNameZh']);
	if (roleNameZh != null) {
		userDetailRole.roleNameZh = roleNameZh;
	}
	return userDetailRole;
}

Map<String, dynamic> $UserDetailRoleToJson(UserDetailRole entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['roleName'] = entity.roleName;
	data['roleNameZh'] = entity.roleNameZh;
	return data;
}

UserDetailAuthorities $UserDetailAuthoritiesFromJson(Map<String, dynamic> json) {
	final UserDetailAuthorities userDetailAuthorities = UserDetailAuthorities();
	final String? authority = jsonConvert.convert<String>(json['authority']);
	if (authority != null) {
		userDetailAuthorities.authority = authority;
	}
	return userDetailAuthorities;
}

Map<String, dynamic> $UserDetailAuthoritiesToJson(UserDetailAuthorities entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['authority'] = entity.authority;
	return data;
}