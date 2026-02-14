import 'package:accessories_store/Features/auth/login/data/models/login_success_model.dart';
import 'package:accessories_store/Features/auth/login/data/repos/login_repo.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:accessories_store/core/services/cache/secure_storage_helper.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiConsumer api;

  LoginRepoImpl(this.api);

  @override
  Future<Either<ServerException, LoginSuccessModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.login,
        data: {ApiKey.email: email, ApiKey.password: password},
      );

      final loginSuccess = LoginSuccessModel.fromJson(response);

      await SecureStorageHelper().saveTokens(
        accessToken: loginSuccess.accessToken,
        refreshToken: loginSuccess.refreshToken,
        expiresAt: loginSuccess.expiresAtUtc,
      );

      return Right(loginSuccess);
    } on ServerException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerException, LoginSuccessModel>> loginWithGoogle() async {
    try {
      final response = await api.post(EndPoint.loginWithGoogle);

      final loginSuccess = LoginSuccessModel.fromJson(response);

      await SecureStorageHelper().saveTokens(
        accessToken: loginSuccess.accessToken,
        refreshToken: loginSuccess.refreshToken,
        expiresAt: loginSuccess.expiresAtUtc,
      );

      return Right(loginSuccess);
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
