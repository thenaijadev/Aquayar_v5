import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:aquayar/config/network/api_endpoint.dart';
import 'package:aquayar/config/network/dio_client.dart';
import 'package:aquayar/config/network/typedef.dart';
import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:aquayar/features/auth/data/models/aquayar_user_box.dart';
import 'package:aquayar/features/user/data/interfaces/user_provider.dart';

import 'package:aquayar/config/network/dio_exception.dart';

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
}
