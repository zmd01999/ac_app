import 'package:flare_flutter/flare_actor.dart';
import 'package:maple/config/size_config.dart';
import 'package:maple/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class SavingsContainer extends StatelessWidget {
  const SavingsContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(85),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color:  Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(6),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '节能减排',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '+35%',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.green.shade300,
                          ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Text(
                      '23.5 kWh',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(90),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            child: FlareActor(
              "assets/gif/reciclar.flr",
              fit: BoxFit.contain,
              alignment: Alignment.center,
              animation: "recycle1_loop",
            ),
            height: getProportionateScreenHeight(80),
            width: getProportionateScreenWidth(140),
          ),
        ),
      ],
    );
  }
}
