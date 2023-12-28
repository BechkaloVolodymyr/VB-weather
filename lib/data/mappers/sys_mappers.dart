import 'package:weather/data/model/sys_model.dart';
import 'package:weather/domain/entities/sys_entity.dart';

class SysMappers {
  SysMappers._();

  static SysEntity mapModel(SysModel model) => SysEntity(
        type: model.type,
        id: model.id,
        country: model.country,
        sunrise: model.sunrise,
        sunset: model.sunset,
      );

  static List<SysEntity> mapModels(List<SysModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
