import 'package:weather/data/model/clouds_model.dart';
import 'package:weather/domain/entities/clouds_entity.dart';

class CloudsMappers {
  CloudsMappers._();

  static CloudsEntity mapModel(CloudsModel model) => CloudsEntity(
        all: model.all,
      );

  static List<CloudsEntity> mapModels(List<CloudsModel> models) =>
      models.map((e) => mapModel(e)).toList();
}
