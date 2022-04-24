import 'dart:convert';
import 'package:maple/generated/json/base/json_field.dart';
import 'package:maple/generated/json/elec_consum_entity.g.dart';

@JsonSerializable()
class ElecConsumEntity {

	late int id;
	late String scene;
	late String seam;
	late String product;
	late int powerConsum;
	late String date;
  
  ElecConsumEntity();

  factory ElecConsumEntity.fromJson(Map<String, dynamic> json) => $ElecConsumEntityFromJson(json);

  Map<String, dynamic> toJson() => $ElecConsumEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}