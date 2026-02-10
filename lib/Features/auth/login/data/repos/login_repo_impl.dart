import 'package:accessories_store/Features/auth/login/data/repos/login_repo.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiConsumer api;

  LoginRepoImpl(this.api);

  @override
  Future<Either<ServerException, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      await api.post(
        EndPoint.login,
        data: {ApiKey.email: email, ApiKey.password: password},
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ServerException, void>> loginWithGoogle() async {
    try {
      await api.post(EndPoint.loginWithGoogle);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
