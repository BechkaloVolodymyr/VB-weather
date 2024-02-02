import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/injector.dart';
import 'package:weather/presentation/controllers/add_weather_location_page_controller.dart';
import 'package:weather/presentation/view/common/widget/text_field_widget.dart';

class AddWeatherLocationPage extends StatefulWidget {
  final String lat;
  final String lon;

  const AddWeatherLocationPage(
      {super.key, required this.lat, required this.lon});

  @override
  State<AddWeatherLocationPage> createState() => _AddWeatherLocationPageState();
}

class _AddWeatherLocationPageState extends State<AddWeatherLocationPage> {
  late AddWeatherLocationPageController screenController;

  final _latitudeTextEditingController = TextEditingController();
  final _longitudeTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    screenController =
        AddWeatherLocationPageController(getIt<WhetherService>());
  }

  @override
  void dispose() {
    screenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          clipBehavior: Clip.none,
          backgroundColor: Colors.transparent,
          title: const Text("text"),
        ),
        body: ChangeNotifierProvider<AddWeatherLocationPageController>.value(
            value: screenController,
            child: Consumer<AddWeatherLocationPageController>(
                builder: (context, controller, child) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/768.JPG'),
                )),
                child: Center(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(90, 139, 171, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          NumberFieldWidget(
                            labelText: "Latitude",
                            controller: _latitudeTextEditingController,
                            error: screenController.latitudeErrorText,
                            onChanged: (value) {
                              screenController.latitude = value;
                            },
                          ),
                          NumberFieldWidget(
                            labelText: "Longitude",
                            controller: _longitudeTextEditingController,
                            error: screenController.longitudeErrorText,
                            onChanged: (value) {
                              screenController.longitude = value;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text("Back")),
                              TextButton.icon(
                                  onPressed: screenController.validate
                                      ? () {
                                          screenController.addCityLocation(
                                            () {
                                              // _latitudeTextEditingController;
                                            },
                                          );
                                        }
                                      : () {},
                                  icon: const Icon(Icons.save),
                                  label: const Text("Add")),
                            ],
                          )
                        ],
                      )),
                ),
              );
            })));
  }
}
