import 'dart:convert';
import 'package:maple/generated/json/base/json_field.dart';
import 'package:maple/generated/json/devices_entity.g.dart';

@JsonSerializable()
class DevicesEntity {

	late String? id;
	late String? type;
	late String? userName;
	late String? nikeName;
	late String? status;
  
  DevicesEntity({this.id, this.type, this.userName, this.nikeName, this.status});

  factory DevicesEntity.fromJson(Map<String, dynamic> json) => $DevicesEntityFromJson(json);

  Map<String, dynamic> toJson() => $DevicesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}