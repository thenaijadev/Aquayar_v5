import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/user/data/interfaces/user_provider.dart';

import 'package:aquayar/config/network/dio_exception.dart';
import 'package:geolocator/geolocator.dart';

class UserProviderImplementation extends UserProvider {
  @override
  EitherAquayarAuthUser updateUser({
    required String name,
    required String gender,
  }) async {
    try {
      final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

      final token = user.authToken;

      await DioClient.instance.patch(
        RoutesAndPaths.user,
        data: {"displayName": name, "gender": gender},
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      user.displayName = name;
      user.gender = gender;
      user.save();

      return right(user);
    } on DioException catch (e) {
      final message = DioExceptionClass.fromDioError(e).errorMessage;
      return left(message);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Position> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  @override
  EitherAquayarAuthUser addLocation({
    required String address,
    required String city,
    double? tankSize,
  }) async {
    try {
      Position position = await getUserLocation();
      final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

      final token = user.authToken;
      final response = await DioClient.instance.post(
        RoutesAndPaths.location,
        data: {
          "address": address,
          "city": city,
          "name": "Home",
          "tankSize": tankSize,
          "longitude": position.longitude,
          "latitude": position.latitude
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );

      user.address = address;
      user.city = city;
      user.addressName = "Home";
      user.waterSize = tankSize;
      user.save();
      return Right(user);
    } on DioException catch (e) {
      final message = DioExceptionClass.fromDioError(e).errorMessage;
      return left(message);
    } catch (e) {
      return left(e.toString());
    }
  }
}
