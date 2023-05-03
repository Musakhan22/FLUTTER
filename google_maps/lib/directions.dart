import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'key.dart';
import 'models/direction_model.dart';

class DirectionsData{
  static const String baseUrl = 
  'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsData({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async{
    final response = await _dio.get(
      baseUrl,
      queryParameters: {
        'origin':'${origin.latitude},${origin.longitude}',
        'destination':'${destination.latitude},${destination.longitude}',
        'key':googleAPIKEY,
      }
    );

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    throw Error();
  }
}