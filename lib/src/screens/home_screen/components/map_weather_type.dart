import 'package:flutter_weather_bg/utils/weather_type.dart';

WeatherType? mapToWeather(String type, String time){

  Map<String, WeatherType> table = {
    WeatherUtil.getWeatherDesc(WeatherType.values[0]):WeatherType.values[0],
    WeatherUtil.getWeatherDesc(WeatherType.values[1]):WeatherType.values[1],
    WeatherUtil.getWeatherDesc(WeatherType.values[2]):WeatherType.values[2],
    WeatherUtil.getWeatherDesc(WeatherType.values[3]):WeatherType.values[3],
    WeatherUtil.getWeatherDesc(WeatherType.values[4]):WeatherType.values[4],
    WeatherUtil.getWeatherDesc(WeatherType.values[5]):WeatherType.values[5],
    "晴晚":WeatherType.values[6],
    WeatherUtil.getWeatherDesc(WeatherType.values[7]):WeatherType.values[7],
    WeatherUtil.getWeatherDesc(WeatherType.values[8]):WeatherType.values[8],
    "多云晚":WeatherType.values[9],
    WeatherUtil.getWeatherDesc(WeatherType.values[10]):WeatherType.values[10],
    WeatherUtil.getWeatherDesc(WeatherType.values[11]):WeatherType.values[11],
    WeatherUtil.getWeatherDesc(WeatherType.values[12]):WeatherType.values[12],
    WeatherUtil.getWeatherDesc(WeatherType.values[13]):WeatherType.values[13],
    WeatherUtil.getWeatherDesc(WeatherType.values[14]):WeatherType.values[14],
  };
  if (table.containsKey(type)){
    if(int.parse(time) > 18 && (type.contains("晴") || type.contains("多云"))) {
      return type.contains("晴") ? table["晴晚"] : table["多云晚"];
    } else {
      return table[type];
    }
  } else {
    if(type.contains("雨")) return type.contains("雷")? WeatherType.thunder : WeatherType.middleRainy;
    else if (type.contains("风")) return WeatherType.overcast;
    else if (type.contains("霾")) return WeatherType.foggy;
    else if (type.contains("雪")) return WeatherType.middleSnow;
    else if (type.contains("雾")) return WeatherType.hazy;
    else if (type.contains("尘")) return WeatherType.dusty;
    else return WeatherType.sunny;


  }
}