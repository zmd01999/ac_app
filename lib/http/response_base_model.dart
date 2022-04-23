import '../generated/json/base/json_convert_content.dart';
class ResponseBaseModel<T>  {
  int? code;
  int? count;
  String? time;
  String? msg;
  T? data;
  List<T?>? dataList;
  ResponseBaseModel({this.code, this.count, this.time, this.msg, this.data, this.dataList});

  ResponseBaseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    count = json['count'];
    time = json['time'];
    if (json['msg'] != null) msg = json['msg'];
    if (json['data'] != null && json['data']!='null') {
      if(json['data'] is List){
        print("isList");
        dataList = JsonConvert.fromJsonAsT<List<T>>(json['data']);
      } else {
        data = JsonConvert.fromJsonAsT<T>(json['data']);
      }
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['count'] = this.count;
    data['time'] = this.time;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}


