List<String> monthName = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

const pitSectorOne = "客厅";
const pitSectorTwo = "卧室";
const pitSectorFour = "自定义场景";

String getDateNow() {
  DateTime now = new DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day);

  String year = yesterday.toString().substring(0, 4);
  String month = yesterday.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = yesterday.toString().substring(8, 10);

  String hasil = "$day $monthNameResult $year";
  return hasil;
}

String getDateToday({String? flag}) {
  DateTime now = new DateTime.now();
  // DateTime nows = DateTime(now.year, now.month, now.day - 1);

  String year = now.toString().substring(0, 4);
  String month = now.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = now.toString().substring(8, 10);

  String hasil = flag == null ? "$year-$month-$day" : "$day $monthNameResult $year";
  return hasil;
}

String getDateNowDaily() {
  DateTime now = new DateTime.now();

  String year = now.toString().substring(0, 4);
  String month = now.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = now.toString().substring(8, 10);
  String time = "05:00:00";

  // String hasil = "$day $monthNameResult $year $time";
  String hasil = "$year-$month-$day $time";
  return hasil;
}

String getDateTommorowDaily() {
  DateTime now = new DateTime.now();
  DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

  String year = tomorrow.toString().substring(0, 4);
  String month = tomorrow.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = tomorrow.toString().substring(8, 10);
  String time = "04:59:59";

  // String hasil = "$day $monthNameResult $year $time";
  String hasil = "$year-$month-$day $time";
  return hasil;
}

String getDateNowMonthly() {
  DateTime now = new DateTime.now();
  DateTime firstDateMonth = new DateTime(now.year, now.month, 1);

  String year = firstDateMonth.toString().substring(0, 4);
  String month = firstDateMonth.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = firstDateMonth.toString().substring(8, 10);
  String time = "05:00:00";

  String hasilDateNowMonthly = "$day $monthNameResult $year $time";
  return hasilDateNowMonthly;
}

String getDateTommorowMonthly() {
  DateTime now = new DateTime.now();
  DateTime lastDateMonth = DateTime(now.year, now.month + 1, 0);

  String year = lastDateMonth.toString().substring(0, 4);
  String month = lastDateMonth.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = lastDateMonth.toString().substring(8, 10);
  String time = "04:59:59";

  String hasilDateTommorowMonthly = "$day $monthNameResult $year $time";
  return hasilDateTommorowMonthly;
}

String getFirstTimeInDay(String day) {
  String dayFormatted = day;
  String time = "05:00:00";

  String hasilFirstTimeInDay = "$dayFormatted $time";
  return hasilFirstTimeInDay;
}

String getLastTimeInDay(String day) {
  String dayFormatted = day;
  String time = "04:59:59";

  String hasilLastTimeInDay = "$dayFormatted $time";
  return hasilLastTimeInDay;
}

String getFirstDateInMonth(String month) {
  DateTime now = new DateTime.now();
  DateTime firstDateMonth = new DateTime(now.year, now.month, 1);

  String year = firstDateMonth.toString().substring(0, 4);
  //String month = firstDateMonth.toString().substring(5, 7);
  String index = (monthName.indexOf(month) + 1).toString();
  String monthNameResult  = index.length == 1 ? "0" + index : index;
  String day = firstDateMonth.toString().substring(8, 10);
  String time = "05:00:00";

  // String hasilDateNowMonthly = "$day $monthNameResult $year $time";
  String hasilDateNowMonthly = "$year-$monthNameResult-01 $time";
  return hasilDateNowMonthly;
}

String getLastDateInMonth(String month) {
  DateTime now = new DateTime.now();
  DateTime lastDateMonth = DateTime(now.year, now.month + 1, 0);

  String year = lastDateMonth.toString().substring(0, 4);
  //String month = lastDateMonth.toString().substring(5, 7);
  String index = (monthName.indexOf(month) + 1).toString();
  String monthNameResult  = index.length == 1 ? "0" + index : index;

  String day = lastDateMonth.toString().substring(8, 10);
  String time = "04:59:59";

  String hasilDateTommorowMonthly = "$year-$monthNameResult-$day $time";
  return hasilDateTommorowMonthly;
}

String getDateNowYearly() {
  DateTime now = new DateTime.now();
  DateTime firstDateMonth = new DateTime(now.year, now.month, 1);

  String year = firstDateMonth.toString().substring(0, 4);
  String time = "05:00:00";

  String hasilDateNowMonthly = "01 Jan $year $time";
  return hasilDateNowMonthly;
}

String getDateTommorowYearly() {
  DateTime now = new DateTime.now();
  DateTime lastDateMonth = DateTime(now.year, now.month + 1, 0);

  String year = lastDateMonth.toString().substring(0, 4);
  String time = "04:59:59";

  String hasilDateTommorowMonthly = "31 Dec $year $time";
  return hasilDateTommorowMonthly;
}

String getFirstDateInYear(DateTime years) {
  DateTime now = years;
  DateTime firstDateMonth = new DateTime(now.year, now.month, 1);

  String year = firstDateMonth.toString().substring(0, 4);
  String time = "05:00:00";

  // String hasilDateNowMonthly = "01 Jan $year $time";
  String hasilDateNowMonthly = " $year-01-01 $time";

  return hasilDateNowMonthly;
}

String getLastDateInYearly(DateTime years) {
  DateTime now = years;
  DateTime lastDateMonth = DateTime(now.year, now.month + 1, 0);

  String year = lastDateMonth.toString().substring(0, 4);
  String time = "04:59:59";

  // String hasilDateTommorowMonthly = "31 Dec $year $time";
  String hasilDateTommorowMonthly = " $year-12-31 $time";
  return hasilDateTommorowMonthly;
}

String getDateFirstForRecent({String? flag}) {
  DateTime now = new DateTime.now();

  String year = now.toString().substring(0, 4);
  String month = now.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = now.toString().substring(8, 10);

  var oneHourago = now.subtract(const Duration(hours: 1));

  String time = oneHourago.toString().substring(11, 16) + ":00";

  // String hasil = "$day $monthNameResult $year $time";
  String hasil = flag == null ? "$year-$month-$day $time" :"$day $monthNameResult $year $time";
  return hasil;
}

String getDateSecondForRecent({String? flag}) {
  DateTime now = new DateTime.now();

  String year = now.toString().substring(0, 4);
  String month = now.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = now.toString().substring(8, 10);

  String time = now.toString().substring(11, 16) + ":00";

  // String hasil = "$day $monthNameResult $year $time";
  String hasil = flag == null ? "$year-$month-$day $time" :"$day $monthNameResult $year $time";
  return hasil;
}

String showDateNow({String? flag}) {
  DateTime now = new DateTime.now();
  String month = now.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String hasil = flag == null ? "$monthNameResult" : month;
  return hasil;
}

String showYearNow() {
  DateTime now = new DateTime.now();
  String year = now.toString().substring(0, 4);

  String hasil = "$year";
  return hasil;
}

String showFirstDateNow({String? flag}) {
  DateTime now = new DateTime.now();
  DateTime firstDateMonth = new DateTime(now.year, now.month, 1);

  String year = firstDateMonth.toString().substring(0, 4);
  String month = firstDateMonth.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = firstDateMonth.toString().substring(8, 10);

  String hasilDateNowMonthly =  flag == null ? "$year-$month-$day" : "$day $monthNameResult $year";
  return hasilDateNowMonthly;
}

String showLastDateNow({String? flag}) {
  DateTime now = new DateTime.now();
  DateTime lastDateMonth = DateTime(now.year, now.month + 1, 0);

  String year = lastDateMonth.toString().substring(0, 4);
  String month = lastDateMonth.toString().substring(5, 7);
  String monthNameResult = monthName[int.parse(month) - 1];

  String day = lastDateMonth.toString().substring(8, 10);

  String hasilDateTommorowMonthly = flag == null ? "$year-$month-$day" : "$day $monthNameResult $year";
  return hasilDateTommorowMonthly;
}
