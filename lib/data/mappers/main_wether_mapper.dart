import 'package:weather/data/model/main_wether_model.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';

class MainWetherMapper {
  MainWetherMapper._();

  static MainWetherEntity mapModel(MainWetherModel model) => MainWetherEntity(
        cod: model.cod,
        name: model.name,
        id: model.id,
        timezone: model.timezone,
        sys: model.sys,
        dt: model.dt,
        clouds: model.clouds,
        rain: model.rain,
        wind: model.wind,
        visibility: model.visibility,
        main: model.main,
        base: model.base,
        weather: model.weather,
        coord: model.coord,
      );

  static List<MainWetherEntity> mapModels(List<MainWetherModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
