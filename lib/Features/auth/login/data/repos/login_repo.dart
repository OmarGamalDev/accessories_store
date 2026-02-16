import 'package:accessories_store/Features/auth/login/data/models/login_success_model.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<ServerException, LoginSuccessModel>> login({
    required String email,
    required String password,
  });

  Future<Either<ServerException, LoginSuccessModel>> loginWithGoogle({
    required String idToken,
  });
}
