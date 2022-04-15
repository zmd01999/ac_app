import 'dart:convert';
import 'package:maple/generated/json/base/json_field.dart';
import 'package:maple/generated/json/weather_entity.g.dart';

@JsonSerializable()
class WeatherEntity {

	late String status;
	late String count;
	late String info;
	late String infocode;
	late List<WeatherLives> lives;
  
  WeatherEntity();

  factory WeatherEntity.fromJson(Map<String, dynamic> json) => $WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => $WeatherEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WeatherLives {

	late String province;
	late String city;
	late String adcode;
	late String weather;
	late String temperature;
	late String winddirection;
	late String windpower;
	late String humidity;
	late String reporttime;
  
  WeatherLives();

  factory WeatherLives.fromJson(Map<String, dynamic> json) => $WeatherLivesFromJson(json);

  Map<String, dynamic> toJson() => $WeatherLivesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}