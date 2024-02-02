import 'package:flutter/foundation.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';
import 'package:weather/domain/services/whether_service.dart';

class AddWeatherLocationPageController extends ChangeNotifier {
  final WhetherService _whetherService;
  final exp = RegExp(r"^(\d*\.)?\d+$");
  bool _loading = false;
  bool _loadError = false;
  String? _latitude;
  String? _longitude;
  String? _latitudeErrorText;
  String? _longitudeErrorText;

  // AddCityPageControllerState addCityPageControllerState =
  //     const AddCityPageControllerState();
  // set state(AddCityPageControllerState state) =>
  //     addCityPageControllerState = state;
  // AddCityPageControllerState get state => addCityPageControllerState;

  var _mainWetherEntity = const MainWetherEntity(); //Check

  bool get loading => _loading;
  bool get loadError => _loadError;
  String? get latitudeErrorText => _latitudeErrorText;
  String? get longitudeErrorText => _longitudeErrorText;

  // double? get latitudeText => _latitudeText;
  // double? get longitudeText => _longitudeText;

  AddWeatherLocationPageController(
    this._whetherService,
  );

  set latitude(String? latitude) {
    _latitude = latitude;
    validateLatitudeTextField();
  }

  set longitude(String? longitude) {
    _longitude = longitude;
    validateLongitudeTextField();
  }

  void validateLatitudeTextField() {
    if (_latitude == null) {
      _latitudeErrorText = "Latitu is Null";
    } else if (_latitude?.isEmpty ?? true) {
      _latitudeErrorText = "Latitu is Empty";
    } else if (!_latitude!.contains(".")) {
      _latitudeErrorText = "Latitu withut '.'";
    } else if (!exp.hasMatch(_latitude!)) {
      _latitudeErrorText = "Must be number with dot inside";
    } else {
      _latitudeErrorText = null;
    }
    notifyListeners();
  }

  void validateLongitudeTextField() {
    if (_longitude == null) {
      _longitudeErrorText = "Longitude is Null";
    } else if (_longitude?.isEmpty ?? true) {
      _longitudeErrorText = "Longitude is Empty";
    } else if (!_longitude!.contains(".")) {
      _longitudeErrorText = "Longitude withut '.'";
    } else if (!exp.hasMatch(_longitude!)) {
      _longitudeErrorText = "Must be number with dot inside";
    } else {
      _longitudeErrorText = null;
    }
    notifyListeners();
  }

  void formValidate() {
    validateLatitudeTextField();
    validateLongitudeTextField();
  }

  bool get validate =>
      _latitudeErrorText == null && _longitudeErrorText == null;

  Future<void> addCityLocation(void Function() onSuccess) async {
    print("Latitu = $_latitude");
    print("Longitute = $_longitude");
    // отримати погоду
    // записати погоду в локальну базу даних
    // final newList = [];
    // var box = await Hive.openBox('WeatherBox');
    //final list = box.get('weathers');
    //if (list == null){newlist.add(Погода зі 62)}else{newList.addAll(list)..add(Погоді із 62)}
    //box.put('weathers', newList);
// а в хом пейдж щоб взяти список погоди
// final list = box.get('weathers');

    // onSuccess закрити сторінку
  }
}
