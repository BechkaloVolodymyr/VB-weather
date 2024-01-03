import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/model/main_wether_model.dart';

@lazySingleton
class RemoteDataSource {
  final Dio restApi;

  RemoteDataSource._(
    this.restApi,
  );

  @factoryMethod
  factory RemoteDataSource() {
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');
    var options = BaseOptions(
      queryParameters: {"appid": tmdbApiKey},
      baseUrl: "https://api.openweathermap.org/data/2.5/",
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
    );

    Dio restApi = Dio(options);

    return RemoteDataSource._(
      restApi,
    );
  }

  @disposeMethod
  Future<void> dispose() async {
    restApi.close(force: true);
  }

  Future<MainWetherModel> getWether(double lat, double lon) async {
    try {
      final response =
          await restApi.get("weather?lat=$lat&lon=$lon&units=metric");

      return MainWetherModel.fromJson(response.data);
    } catch (e, _) {
      rethrow;
    }
  }
}
