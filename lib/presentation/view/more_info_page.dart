import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain/entities/main_wether_entity.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key, this.mainWetherEntity});
  final MainWetherEntity? mainWetherEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/234.JPG'),
        )),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(172, 115, 106, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        mainWetherEntity?.name ?? "No Data",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.cloud_sharp,
                            size: 60,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            mainWetherEntity?.main?.temp.toString() ??
                                "No Data",
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
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
