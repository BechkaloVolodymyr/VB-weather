import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/data/model/clouds_model.dart';
import 'package:weather/data/model/coord_model.dart';
import 'package:weather/data/model/main_model.dart';
import 'package:weather/data/model/rain_model.dart';
import 'package:weather/data/model/sys_model.dart';
import 'package:weather/data/model/weather_model.dart';
import 'package:weather/data/model/wind_model.dart';
part 'main_wether_entity.freezed.dart';

@freezed
class MainWetherEntity with _$MainWetherEntity {
  const factory MainWetherEntity({
    int? cod,
    String? name,
    int? id,
    int? timezone,
    SysModel? sys,
    int? dt,
    CloudsModel? clouds,
    RainModel? rain,
    WindModel? wind,
    int? visibility,
    MainModel? main,
    String? base,
    List<WeatherModel>? weather,
    CoordModel? coord,
  }) = _MainWetherEntity;
}
