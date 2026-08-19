import 'package:evently_app/Providers/app_location_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppLocationProvider>(
        context,
        listen: false,
      ).getCurrentLocation();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var locationProvider = Provider.of<AppLocationProvider>(context);
    if (locationProvider.userLocation == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.primaryLight),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: locationProvider.userLocation!,
              zoom: 15,
            ),
            zoomControlsEnabled: false,
            onTap: (latLng) {
              locationProvider.getEventLocation(latLng);
              Future.delayed(Duration(seconds: 2), () {
                Navigator.of(context).pop();
              });
            },
            markers: locationProvider.eventLocation != null
                ? {
                    Marker(
                      markerId: MarkerId("Selected Location"),
                      position: locationProvider.eventLocation!,
                      icon: BitmapDescriptor.defaultMarker,
                    ),
                  }
                : {},
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.02),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadiusGeometry.circular(10),
              ),
              child: Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.tapOnLocationToSelect,
                style: AppStyles.medium20White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
