import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain/services/location_service.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/injector.dart';
import 'package:weather/presentation/controllers/home_page_controller.dart';
import 'package:weather/presentation/view/common/custom_image_network.dart';
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
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromRGBO(145, 180, 198, 1),
        onPressed: () {
          screenController.loadData(getMyWeather: true);
        },
        child: const Icon(Icons.gps_fixed),
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
                      : Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Material(
                                    color:
                                        const Color.fromRGBO(145, 180, 198, 1),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MoreInfoPage(
                                                mainWetherEntity:
                                                    screenController
                                                        .state.weather),
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
                                                    screenController.state
                                                            .weather?.name ??
                                                        "No Data",
                                                    style: const TextStyle(
                                                        fontSize: 20),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CustomImageNetwork(
                                                  imageName: screenController
                                                          .state
                                                          .weather
                                                          ?.weather?[0]
                                                          .icon ??
                                                      "",
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  screenController.state.weather
                                                          ?.main?.temp
                                                          .toString() ??
                                                      "No Data",
                                                  style: const TextStyle(
                                                      fontSize: 40),
                                                ),
                                                const Text(
                                                  "\u2103",
                                                  style:
                                                      TextStyle(fontSize: 40),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              DateFormat('dd.MM.yyyy')
                                                  .format(DateTime.now()),
                                              style:
                                                  const TextStyle(fontSize: 20),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      const Text(
                                                        "Pressure:",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        "${screenController.state.weather?.main?.pressure.toString() ?? "No Data"}hPa",
                                                        style: const TextStyle(
                                                            fontSize: 20),
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
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        "${screenController.state.weather?.main?.humidity.toString() ?? "No Data"}%",
                                                        style: const TextStyle(
                                                            fontSize: 20),
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
                        ),
            );
          },
        ),
      ),
    );
  }
}
