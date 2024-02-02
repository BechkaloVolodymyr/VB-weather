import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';
import 'package:weather/domain/services/location_service.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/injector.dart';
import 'package:weather/presentation/controllers/home_page_controller.dart';
import 'package:weather/presentation/view/add_weather_location_page.dart';
import 'package:weather/presentation/view/common/widget/custom_image_network.dart';
import 'package:weather/presentation/view/more_info_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomePageController screenController;

  @override
  void initState() {
    super.initState();
    screenController =
        HomePageController(getIt<WhetherService>(), getIt<LocationService>());
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
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                screenController.loadData();
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text("Whether"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromRGBO(145, 180, 198, 1),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddWeatherLocationPage(
                      lat: "",
                      lon: "",
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromRGBO(145, 180, 198, 1),
              onPressed: () {
                screenController.loadData(getMyWeather: true);
              },
              child: const Icon(Icons.gps_fixed),
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider<HomePageController>.value(
        value: screenController,
        child: Consumer<HomePageController>(
          builder: (context, controller, child) {
            return DecoratedBox(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/123.JPG'),
                )),
                child: controller.state.loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.state.loadingError
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Error"),
                                ElevatedButton(
                                  onPressed: () {
                                    screenController.loadData();
                                  },
                                  child: const Text("Try again"),
                                )
                              ],
                            ),
                          )
                        : WetherListItem(
                            wether: screenController.state.weather!,
                          ));
          },
        ),
      ),
    );
  }
}

class WetherListItem extends StatelessWidget {
  const WetherListItem({
    super.key,
    required this.wether,
  });
  final MainWetherEntity wether;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Material(
                color: const Color.fromRGBO(145, 180, 198, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MoreInfoPage(mainWetherEntity: wether),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Text(
                                wether.name ?? "No Data",
                                style: const TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Icon(
                              Icons.more_vert,
                              size: 30,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomImageNetwork(
                              imageName: wether.weather?[0].icon ?? "",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              wether.main?.temp.toString() ?? "No Data",
                              style: const TextStyle(fontSize: 40),
                            ),
                            const Text(
                              "\u2103",
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          DateFormat('dd.MM.yyyy').format(DateTime.now()),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Divider(
                          color: Colors.white54,
                          height: 2,
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Pressure:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "${wether.main?.pressure.toString() ?? "No Data"}hPa",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Humidity:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "${wether.main?.humidity.toString() ?? "No Data"}%",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
