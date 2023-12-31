import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends ChangeNotifier {
  // Future<Position?> _getUserPosition() async {
  //   LocationPermission permission;
  //   final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return null;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied ||
  //         permission == LocationPermission.deniedForever) {
  //       return null;
  //     }
  //   } else if (permission == LocationPermission.deniedForever) {
  //     return null;
  //   }
  //   return Geolocator.getCurrentPosition();
  // }
  Position? _position;

  Position? get position => _position;

  Future<void> getUserLocation() async {
    // Check for permissions first
    if (await Geolocator.isLocationServiceEnabled()) {
      try {
        _position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        notifyListeners();
      } catch (error) {
        print('Error getting location: $error');
      }
    } else {
      // Handle the case where location services are disabled
    }
  }
}
