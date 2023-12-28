import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/model/clouds_model.dart';
import 'package:weather/data/model/coord_model.dart';
import 'package:weather/data/model/main_model.dart';
import 'package:weather/data/model/rain_model.dart';
import 'package:weather/data/model/sys_model.dart';
import 'package:weather/data/model/weather_model.dart';
import 'package:weather/data/model/wind_model.dart';

part 'main_wether_model.g.dart';

@JsonSerializable(createToJson: false)
class MainWetherModel {
  final int? cod;
  final String? name;
  final int? id;
  final int? timezone;
  final SysModel? sys;
  final int? dt;
  final CloudsModel? clouds;
  final RainModel? rain;
  final WindModel? wind;
  final int? visibility;
  final MainModel? main;
  final String? base;
  final List<WeatherModel>? weather;
  final CoordModel? coord;

  MainWetherModel({
    this.cod,
    this.name,
    this.id,
    this.timezone,
    this.sys,
    this.dt,
    this.clouds,
    this.rain,
    this.wind,
    this.visibility,
    this.main,
    this.base,
    this.weather,
    this.coord,
  });

  factory MainWetherModel.fromJson(Map<String, dynamic> json) =>
      _$MainWetherModelFromJson(json);
}
