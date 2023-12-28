import 'package:weather/data/model/coord_model.dart';
import 'package:weather/domain/entities/coord_entity.dart';

class CoordMappers {
  CoordMappers._();

  static CoordEntity mapModel(CoordModel model) => CoordEntity(
        lon: model.lon,
        lat: model.lat,
      );

  static List<CoordEntity> mapModels(List<CoordModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
