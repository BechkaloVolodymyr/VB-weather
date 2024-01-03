import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/domain/services/location_service.dart';
import 'package:weather/domain/services/whether_service.dart';
import 'package:weather/injector.dart';
import 'package:weather/presentation/controllers/home_page_controller.dart';
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
                screenController.loadData(getMyWeather: true);
              },
              icon: const Icon(Icons.gps_fixed))
        ],
        title: const Text("Whether"),
      ),
      body: ChangeNotifierProvider<HomePageController>.value(
        value: screenController,
        child:
            Consumer<HomePageController>(builder: (context, controller, child) {
          return controller.state.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.state.loadingError
                  ? const Center(
                      child: Text("Error"),
                    )
                  : DecoratedBox(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/123.JPG'),
                      )),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MoreInfoPage()),
                                  );
                                },
                                child: Container(
                                  height: 100,
                                  color: Colors.amber,
                                  child: Center(
                                      child: Text(screenController
                                              .state.weather?.name ??
                                          "No Data")),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                color: Colors.blue,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
        }),
      ),
    );
  }
}
