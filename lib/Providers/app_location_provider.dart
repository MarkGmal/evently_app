import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AppLocationProvider extends ChangeNotifier {
  LatLng? userLocation;
  LatLng? eventLocation;
  String? eventAddress;

  Future<void> getCurrentLocation() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      userLocation = LatLng(position.latitude, position.longitude);
      notifyListeners();
    } else if (permission.isPermanentlyDenied) {
      openAppSettings();
    } else if (permission.isDenied) {}
  }

  void getEventLocation(LatLng latLng) async {
    eventLocation = latLng;
    eventAddress = await getEventAddress();
    notifyListeners();
  }

  Future<String> getEventAddress() async {
    final Geocoding geocoding = Geocoding();
    List<Placemark> placemarks = await geocoding.placemarkFromCoordinates(
      eventLocation!.latitude,
      eventLocation!.longitude,
    );
    return "${placemarks[0].subThoroughfare}, ${placemarks[0].locality}, ${placemarks[0].country}";
  }
}
