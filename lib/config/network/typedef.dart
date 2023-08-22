import 'package:aquayar/features/auth/data/models/aquayar_auth_user.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase/supabase.dart';

typedef EitherMap = Future<Either<String, Map<String, dynamic>>>;
typedef EitherString = Future<Either<String, String>>;

typedef EitherList = Future<Either<String, List<dynamic>>>;

typedef EitherAquayarAuthUser = Future<Either<String, AquayarAuthUser>>;

typedef EitherUser = Future<Either<String, User>>;
