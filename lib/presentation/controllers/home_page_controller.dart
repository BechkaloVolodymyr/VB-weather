import 'package:flutter/material.dart';
import 'package:weather/domain/services/location_service.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/presentation/controllers/states/home_page_controller_state.dart';

const defaultPositionLat = 49.3521932;
const defaultPositionLon = 23.4279711;

class HomePageController extends ChangeNotifier {
  final WhetherService _whetherService;
  final LocationService _locationService;

  HomePageControllerState homePageControllerState =
      const HomePageControllerState();

  set state(HomePageControllerState state) => homePageControllerState = state;
  HomePageControllerState get state => homePageControllerState;

  HomePageController(
    this._whetherService,
    this._locationService,
  ) {
    loadData();
  }

  void loadData({bool getMyWeather = false}) async {
    homePageControllerState = homePageControllerState.copyWith(
      loading: true,
      loadingError: false,
      weather: null,
    );
    notifyListeners();

    try {
      double lat = defaultPositionLat;
      double lon = defaultPositionLon;
      if (getMyWeather) {
        final position = await _locationService.determinePosition();
        if (position != null) {
          lat = position.latitude;
          lon = position.longitude;
        }
      }
      final whether = await _whetherService.getWhether(lat, lon);

      homePageControllerState = homePageControllerState.copyWith(
        loading: false,
        loadingError: false,
        weather: whether,
      );
    } catch (e, _) {
      homePageControllerState = homePageControllerState.copyWith(
        loading: false,
        loadingError: true,
        weather: null,
      );
    } finally {
      notifyListeners();
    }
  }
}
