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
    // Map<String, dynamic> commonHeaders = {
    //   if (!kIsWeb)
    //     HttpHeaders.userAgentHeader:
    //         'iBilly ${Platform.isIOS ? "iOS" : "Android"} App',
    //   HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    // };
    const tmdbApiKey = String.fromEnvironment('TMDB_KEY');
    var options = BaseOptions(
      queryParameters: {"appid": tmdbApiKey},
      baseUrl: "https://api.openweathermap.org/data/2.5/",
      // headers: commonHeaders,
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

  Future<MainWetherModel> getWether(String cityName) async {
    try {
      final response = await restApi.get("weather?q=$cityName");
      print(response);

      return MainWetherModel.fromJson(response.data);
    } catch (e, _) {
      print(
        e,
      );
      rethrow;
    }
  }
}
