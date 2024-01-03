import 'package:weather/data/model/wind_model.dart';
import 'package:weather/domain/entities/wind_entity.dart';

class WindMappers {
  WindMappers._();

  static WindEntity mapModel(WindModel model) => WindEntity(
        speed: model.speed,
        deg: model.deg,
        gust: model.gust,
      );

  static List<WindEntity> mapModels(List<WindModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
