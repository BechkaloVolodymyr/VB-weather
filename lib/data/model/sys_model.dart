import 'package:json_annotation/json_annotation.dart';

part 'sys_model.g.dart';

@JsonSerializable(createToJson: false)
class SysModel {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory SysModel.fromJson(Map<String, dynamic> json) =>
      _$SysModelFromJson(json);
}
