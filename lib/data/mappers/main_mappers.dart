import 'package:weather/data/model/main_model.dart';
import 'package:weather/domain/entities/main_entity.dart';

class MainMappers {
  MainMappers._();

  static MainEntity mapModel(MainModel model) => MainEntity(
        temp: model.temp,
        feelsLike: model.feelsLike,
        tempMin: model.tempMin,
        tempMax: model.tempMax,
        pressure: model.pressure,
        humidity: model.humidity,
      );

  static List<MainEntity> mapModels(List<MainModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
