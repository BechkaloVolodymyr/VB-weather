import 'package:weather/data/model/rain_model.dart';
import 'package:weather/domain/entities/rain_entity.dart';

class RainMappers {
  RainMappers._();

  static RainEntity mapModel(RainModel model) => RainEntity(
        oneH: model.oneH,
      );

  static List<RainEntity> mapModels(List<RainModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
