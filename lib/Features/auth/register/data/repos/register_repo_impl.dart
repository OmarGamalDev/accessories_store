import 'package:accessories_store/Features/auth/register/data/repos/register_repo.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiConsumer api;

  RegisterRepoImpl(this.api);

  @override
  Future<Either<ServerException, void>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await api.post(
        EndPoint.register,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
