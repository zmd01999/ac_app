import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/utils/weather_type.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/src/entity/home/weather_entity.dart';
class WeatherItem extends StatelessWidget {
  final WeatherType weatherType;
  final WeatherEntity weatherEntity;
  WeatherItem({Key? key, required this.weatherType, required this.weatherEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      child: ClipPath(
        child: Stack(
          children: [
            WeatherBg(
              weatherType: weatherType,
              width: MediaQuery.of(context).size.width,
              height: 130,
            ),
            Container(
              alignment: Alignment(0.8, 0),
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    weatherEntity.lives[0].temperature + "℃",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    weatherEntity.lives[0].weather,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(
                    weatherEntity.lives[0].reporttime.split(" ")[0],
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    weatherEntity.lives[0].province + ","+ weatherEntity.lives[0].city,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              )

              // Text(
              //   WeatherUtil.getWeatherDesc(weatherType),
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 25,
              //       fontWeight: FontWeight.bold),
              // ),
            ),

          ],
        ),
        clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
      ),
    );
  }
}