import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/locations/data/providers/location_provider.dart';
import 'package:aquayar/features/orders/data/models/driver.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class OrderProviderImplementation {
  EitherList getAllOrders() async {
    try {
      final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

      final response = await DioClient.instance.get(
        RoutesAndPaths.userOrders,
        options: Options(
          headers: {"Authorization": "Bearer ${user.authToken}"},
        ),
      );

      return right(response["data"]["orders"]);
    } on DioException catch (e) {
      return left(e.response?.data);
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherDriver getNearestDriver({
    required double waterSize,
    required double longitude,
    required double latitude,
  }) async {
    try {
      final AquayarAuthUser user = AquayarBox.getAquayarUser().values.last;

      final response = await DioClient.instance.post(
        RoutesAndPaths.orderInit,
        data: {
          "waterSize": waterSize,
          "longitude": longitude,
          "latitude": latitude
        },
        options: Options(
          headers: {"Authorization": "Bearer ${user.authToken}"},
        ),
      );
      final driverData = response["data"];

      final Driver driver = Driver.fromMap(driverData);
      return right(driver);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherMap getPrice(
      {required String token,
      required double waterSize,
      required String startLocation,
      required String endLocation}) async {
    try {
      List<String> parts = endLocation.split(',');

      // var directions =
      //     await LocationProvider().getDirections(startLocation, endLocation);
      var data = await LocationProvider().getPlace(startLocation);

      final time = await LocationProvider().getTransitTime(
          "${data?["geometry"]["location"]["lat"]},${data?["geometry"]["location"]["lng"]}",
          "${double.parse(parts[1])},${double.parse(parts[0])}");

      final distance = Geolocator.distanceBetween(
        data?["geometry"]["location"]["lat"],
        data?["geometry"]["location"]["lng"],
        double.parse(parts[1]),
        double.parse(parts[0]),
      );

      final response = await DioClient.instance.post(
        RoutesAndPaths.getPrice,
        data: {
          "waterSize": waterSize,
          "distance": distance,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      return right({...response, "time": time, "distance": distance});
    } on DioException catch (e) {
      return left(e.response?.data);
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherMap createOrder({
    required String token,
    required double waterSize,
    required String startLocation,
    required String endLocation,
    required double price,
    required String driver,
  }) async {
    try {
      var directions =
          await LocationProvider().getDirections(startLocation, endLocation);

      final distance = Geolocator.distanceBetween(
          directions?["start_location"]["lat"],
          directions?["start_location"]["lng"],
          directions?["end_location"]["lat"],
          directions?["end_location"]["lng"]);

      final response = await DioClient.instance.post(
        RoutesAndPaths.createOrder,
        data: {
          "waterSize": waterSize,
          "distance": distance,
          "price": price,
          "latitude": directions?["start_location"]["lat"],
          "longitude": directions?["start_location"]["lng"],
          "driver": driver
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(e.response?.data);
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherMap getOrderDetails(
      {required String token, required String orderId}) async {
    try {
      final response = await DioClient.instance.get(
        "${RoutesAndPaths.createOrder}/$orderId",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(e.response?.data);
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherMap cancelOrder(
      {required String token, required String orderId}) async {
    try {
      final response = await DioClient.instance.post(
        "${RoutesAndPaths.createOrder}/$orderId/cancel",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(e.response?.data);
    } catch (e) {
      return left(e.toString());
    }
  }

  EitherMap payForOrder(
      {required String token,
      required String orderId,
      required int price,
      required String email}) async {
    try {
      final response = await DioClient.instance.post(
        "${RoutesAndPaths.createOrder}/$orderId/pay",
        data: {
          "email": email,
          "price": price,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );
      print(response);
      return right(response);
    } on DioException catch (e) {
      print(e.response?.data);
      return left(e.response?.data);
    } catch (e) {
      print(e.toString());

      return left(e.toString());
    }
  }
}
