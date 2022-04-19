import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'conponents/stat_bottom_app_bar.dart';
import 'conponents/stats_device_consumption_chart.dart';
import 'conponents/stats_electricity_usage_chart.dart';
import 'conponents/type_selection.dart';

class OverViewStats extends StatelessWidget {
  const OverViewStats({Key? key}) : super(key: key);

  static String routeName = '/overview-stats-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        title: const Padding(
          padding: EdgeInsets.only(top: 20, left: 15),
          child: Text(
            '统计概览',
            style: TextStyle(
              fontFamily: 'Lexend',
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 20, right: 15),
            child: Icon(
              Icons.bolt,
              size: 36,
              color: Colors.black,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: const [
          TypeSelection(),
          SizedBox(height: 15),
          Expanded(
            child: StatsElectricityUsageChart(),
          ),
          SizedBox(height: 15),
          Expanded(
            child: StatsDeviceConsumptionChart(),
          ),
          SizedBox(height: 15),
        ],
      ),
      bottomNavigationBar: const StatsBottomAppBar(),
    );
  }
}