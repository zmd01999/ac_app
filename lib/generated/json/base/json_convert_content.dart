// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:maple/src/entity/home/devices_entity.dart';
import 'package:maple/src/entity/home/weather_entity.dart';
import 'package:maple/src/entity/statistic/elec_consum_entity.dart';
import 'package:maple/src/entity/statistic/energy_adv_entity.dart';
import 'package:maple/src/entity/user/user_entity.dart';

JsonConvert jsonConvert = JsonConvert();

class JsonConvert {

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }
  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
		final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type ==  "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type ==  "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  } 
	//Go back to a single instance by type
	static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
		final String type = M.toString();
		if(type == (DevicesEntity).toString()){
			return DevicesEntity.fromJson(json) as M;
		}
		if(type == (WeatherEntity).toString()){
			return WeatherEntity.fromJson(json) as M;
		}
		if(type == (WeatherLives).toString()){
			return WeatherLives.fromJson(json) as M;
		}
		if(type == (ElecConsumEntity).toString()){
			return ElecConsumEntity.fromJson(json) as M;
		}
		if(type == (EnergyAdvEntity).toString()){
			return EnergyAdvEntity.fromJson(json) as M;
		}
		if(type == (UserEntity).toString()){
			return UserEntity.fromJson(json) as M;
		}
		if(type == (UserDetail).toString()){
			return UserDetail.fromJson(json) as M;
		}
		if(type == (UserDetailRole).toString()){
			return UserDetailRole.fromJson(json) as M;
		}
		if(type == (UserDetailAuthorities).toString()){
			return UserDetailAuthorities.fromJson(json) as M;
		}

		print("$type not found");
	
		return null;
}

  //list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<DevicesEntity>[] is M){
			return data.map<DevicesEntity>((Map<String, dynamic> e) => DevicesEntity.fromJson(e)).toList() as M;
		}
		if(<WeatherEntity>[] is M){
			return data.map<WeatherEntity>((Map<String, dynamic> e) => WeatherEntity.fromJson(e)).toList() as M;
		}
		if(<WeatherLives>[] is M){
			return data.map<WeatherLives>((Map<String, dynamic> e) => WeatherLives.fromJson(e)).toList() as M;
		}
		if(<ElecConsumEntity>[] is M){
			return data.map<ElecConsumEntity>((Map<String, dynamic> e) => ElecConsumEntity.fromJson(e)).toList() as M;
		}
		if(<EnergyAdvEntity>[] is M){
			return data.map<EnergyAdvEntity>((Map<String, dynamic> e) => EnergyAdvEntity.fromJson(e)).toList() as M;
		}
		if(<UserEntity>[] is M){
			return data.map<UserEntity>((Map<String, dynamic> e) => UserEntity.fromJson(e)).toList() as M;
		}
		if(<UserDetail>[] is M){
			return data.map<UserDetail>((Map<String, dynamic> e) => UserDetail.fromJson(e)).toList() as M;
		}
		if(<UserDetailRole>[] is M){
			return data.map<UserDetailRole>((Map<String, dynamic> e) => UserDetailRole.fromJson(e)).toList() as M;
		}
		if(<UserDetailAuthorities>[] is M){
			return data.map<UserDetailAuthorities>((Map<String, dynamic> e) => UserDetailAuthorities.fromJson(e)).toList() as M;
		}

		print("${M.toString()} not found");
	
		return null;
}

  static M? fromJsonAsT<M>(dynamic json) {
		if(json == null){
			return null;
		}		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return _fromJsonSingle<M>(json as Map<String, dynamic>);
		}
	}
}