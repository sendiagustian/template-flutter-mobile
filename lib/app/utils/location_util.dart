// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationUtil {
//   Future<LatLng?> getUserLocation(LocationAccuracy accuracy) async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: accuracy,
//       );

//       return LatLng(position.latitude, position.longitude);
//     } catch (e) {
//       // Handle errors, such as location services being disabled or permission denied.
//       debugPrint('Error getting user location: $e');
//       return null;
//     }
//   }
// }
