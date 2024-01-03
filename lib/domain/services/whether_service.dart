import 'package:injectable/injectable.dart';
import 'package:weather/data/mappers/main_wether_mapper.dart';
import 'package:weather/data/sources/remote_data_source.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';

@lazySingleton
class WhetherService {
  final RemoteDataSource _remoteDataSource;

  const WhetherService(
    this._remoteDataSource,
  );

  Future<MainWetherEntity> getWhether(double lat, double lon) async {
    final remoteWether = await _remoteDataSource.getWether(lat, lon);
    return MainWetherMapper.mapModel(remoteWether);
  }
}
