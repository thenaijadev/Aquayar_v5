import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/payment/data/models/payment_details.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PaymentProvider {
  EitherPaymentDetails payForOrder({
    required String token,
    required String orderId,
  }) async {
    try {
      print(orderId);
      final response = await DioClient.instance.post(
        "${RoutesAndPaths.createOrder}/$orderId/pay",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response["status"] == false) {
        return left("Unable to process payment");
      }

      return right(PaymentDetails.fromJson(response));
    } on DioException catch (e) {
      print(e.response?.data);
      return left("${e.response?.data}");
    } catch (e) {
      print(e.toString());

      return left(e.toString());
    }
  }
}
