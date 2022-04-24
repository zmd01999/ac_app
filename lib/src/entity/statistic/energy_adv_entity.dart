import 'dart:convert';
import 'package:maple/generated/json/base/json_field.dart';
import 'package:maple/generated/json/energy_adv_entity.g.dart';

@JsonSerializable()
class EnergyAdvEntity {

	late String? scene;
	late double? powerConsum;
	late double? smartConsum;
	late double? tradConsum;
	late String? date;
  
  EnergyAdvEntity({this.scene, this.powerConsum, this.smartConsum, this.tradConsum,this.date});

  factory EnergyAdvEntity.fromJson(Map<String, dynamic> json) => $EnergyAdvEntityFromJson(json);

  Map<String, dynamic> toJson() => $EnergyAdvEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}