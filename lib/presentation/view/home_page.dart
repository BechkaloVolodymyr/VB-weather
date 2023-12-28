import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/sources/remote_data_source.dart';
import 'package:weather/presentation/view/more_info_page.dart';

String apiKey = '';
String cityName = 'London';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dio = Dio();
  final String url =
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

  // void configureDio() {
  //   const tmdbApiKey = String.fromEnvironment('TMDB_KEY');
  //   if (tmdbApiKey.isEmpty) {
  //     throw AssertionError('TMDB_KEY is not set');
  //   }

  //   // dio.options.baseUrl =
  //   //     'http://api.openweathermap.org/data/2.5/forecast?id=524901&appid=5040a3c9d1f7218a503e57622235c6ec';
  //   dio.options.connectTimeout = const Duration(seconds: 5);
  //   dio.options.receiveTimeout = const Duration(seconds: 3);
  // }

  void fetchWeatherData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Process weather data
        print(data);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.swipe_right_alt_sharp))
        ],
        title: Text(widget.title),
      ),
      body: DecoratedBox(
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
                          builder: (context) => const MoreInfoPage()),
                    );
                  },
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                    child: const Center(child: Text("text1")),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // final response = await dio.get(
            //     "https://api.openweathermap.org/data/2.5/weather?lat=49.3521932&lon=23.4279711&appid=5040a3c9d1f7218a503e57622235c6ec");
            // print(response);
            // fetchWeatherData();
            final remote = RemoteDataSource();
            final response = await remote.getWether(cityName);
            print(response);
          } catch (e) {
            print(e);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
