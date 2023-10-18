import 'dart:convert';

import 'package:aquayar/config/logger/logger.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart' as http;

class LocationProvider {
  final String key = "AIzaSyC8o3ShF1B6EBxuEqY04RTZ9bGKcfYmkM8";
  Future<String?> getPlaceId(String input) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonData = json.decode(response.body);
          var placeId = jsonData["candidates"][0]["place_id"] as String;

          return placeId;
        } else {
          logger.e('Response does not contain JSON data.');
        }
      } else {
        logger.e('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return null;
  }

  Future<Map<String, dynamic>?> getPlace(String input) async {
    final String? placeId = await getPlaceId(input);
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonData = json.decode(response.body);

          var results = jsonData['result'] as Map<String, dynamic>;

          return results;
        } else {
          logger.e('Response does not contain JSON data.');
        }
      } else {
        logger.e('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      logger.e("Here: ${e.toString()}");
    }
    return null;
  }

  Future<Map<String, dynamic>?> getDirections(
      String origin, String destination) async {
    String url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=lekki&destination=ikeja&key=$key";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonData = json.decode(response.body);
          final results = {
            "bounds_ne": jsonData['routes'][0]["bounds"]["northeast"],
            "bounds_sw": jsonData['routes'][0]["bounds"]["southwest"],
            "start_location": jsonData['routes'][0]["legs"][0]
                ["start_location"],
            "end_location": jsonData['routes'][0]["legs"][0]["end_location"],
            "polyline": jsonData['routes'][0]["overview_polyline"]["points"],
            "polyline_decoded": PolylinePoints().decodePolyline(
                jsonData['routes'][0]["overview_polyline"]["points"]),
          };
          return results;

          // var results = jsonData['result'] as Map<String, dynamic>;
        } else {
          logger.e('Response does not contain JSON data.');
        }
      } else {
        logger.e('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return null;
  }

  Future<String?> getTransitTime(String origin, String destination) async {
    String url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?destinations=$origin&origins=$destination&units=metric&key=$key";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonData = json.decode(response.body);
          return jsonData["rows"][0]["elements"][0]["duration"]["text"];
        } else {
          logger.e('Response does not contain JSON data.');
        }
      } else {
        logger.e('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // logger.e(e.toString());
    }
    return null;
  }

  Future<String?> getAddressFromCorrdinates(
    String origin,
  ) async {
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$origin&key=$key";

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ==
            true) {
          var jsonData = json.decode(response.body);

          return jsonData["results"][0]["formatted_address"];
        } else {
          logger.e('Response does not contain JSON data.');
        }
      } else {
        logger.e('HTTP request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // logger.e(e.toString());
    }
    return null;
  }
}
