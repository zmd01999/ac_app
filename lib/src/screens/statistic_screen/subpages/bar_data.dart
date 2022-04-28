import 'package:maple/src/entity/statistic/coal_mining.dart';

class BarData {
  static int interval = 5;

  static List<CoalMining> barData = [
    CoalMining(
        transactionDate: "2021-08-27",
        sector: '1',
        tonnageShift1: 15.05,
        tonnageShift2: 16.05,
        totalTonnage: 20,
        jmp: 300.00,
        ibs: 0.00,
        achievementJmp: 19.00,
        achievementIbs: 0.00),
    CoalMining(
        transactionDate: "2021-08-27",
        sector: '2',
        tonnageShift1: 11.05,
        tonnageShift2: 14.05,
        totalTonnage: 10,
        jmp: 310.00,
        ibs: 0.00,
        achievementJmp: 25.50,
        achievementIbs: 0.00),
  ];
}
