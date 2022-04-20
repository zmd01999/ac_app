import 'package:flutter_weather_bg/utils/weather_type.dart';
import 'package:maple/api/api.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/src/entity/home/weather_entity.dart';
import 'package:maple/src/screens/home_screen/components/weather_am.dart';
import 'package:maple/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

import 'map_weather_type.dart';


class WeatherContainer extends StatefulWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);
  final HomeScreenViewModel model;

  @override
  State<WeatherContainer> createState() => _WeatherContainer();
}

class _WeatherContainer extends State<WeatherContainer> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<WeatherEntity?>(
            future: Api.getWeather(), // a previously-obtained Future<String> or null
            builder: (BuildContext context, AsyncSnapshot<WeatherEntity?> snapshot) {
              if(snapshot.hasData){
                String time = snapshot.data!.lives[0].reporttime.split(" ")[1].split(":")[0];
                WeatherType? weatherType = mapToWeather(snapshot.data!.lives[0].weather, time);
                return WeatherItem(weatherType: weatherType!, weatherEntity: snapshot.data!);
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: getProportionateScreenHeight(73),
                  ),
                  child: CircularProgressIndicator(color: Colors.grey.shade300,),
                );
              }
            })
      ],
    );
  }
}
