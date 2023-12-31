import 'package:weather/data/model/snow_model.dart';
import 'package:weather/domain/entities/snow_entity.dart';

class SnowMappers {
  SnowMappers._();

  static SnowEntity mapModel(SnowModel model) => SnowEntity(
        oneH: model.oneH,
      );

  static List<SnowEntity> mapModels(List<SnowModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
