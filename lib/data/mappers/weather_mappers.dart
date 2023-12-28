import 'package:weather/data/model/weather_model.dart';
import 'package:weather/domain/entities/weather_entity.dart';

class WeatherMappers {
  WeatherMappers._();

  static WeatherEntity mapModel(WeatherModel model) => WeatherEntity(
        id: model.id,
        main: model.main,
        description: model.description,
        icon: model.icon,
      );

  static List<WeatherEntity> mapModels(List<WeatherModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
