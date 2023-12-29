import 'package:flutter/material.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/presentation/controllers/states/home_page_controller_state.dart';

class HomePageController extends ChangeNotifier {
  final WhetherService _whetherService;

  HomePageControllerState homePageControllerState =
      const HomePageControllerState();

  set state(HomePageControllerState state) => homePageControllerState = state;
  HomePageControllerState get state => homePageControllerState;

  HomePageController(
    this._whetherService,
  ) {
    loadData();
  }

  void loadData() async {
    homePageControllerState = homePageControllerState.copyWith(
      loading: true,
      loadingError: false,
      weather: null,
    );
    notifyListeners();

    try {
      final whether = await _whetherService.getWhether("London");

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
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
