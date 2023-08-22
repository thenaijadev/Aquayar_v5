import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
      print(response);
      return right(response["data"]["orders"]);
    } on DioException catch (e) {
      print(e.response?.data);

      return left(e.response?.data);
    } catch (e) {
      print(e);

      return left(e.toString());
    }
  }
}
