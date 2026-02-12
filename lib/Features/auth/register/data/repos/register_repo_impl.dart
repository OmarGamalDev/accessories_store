import 'package:accessories_store/Features/auth/register/data/models/register_success_model.dart';
import 'package:accessories_store/Features/auth/register/data/repos/register_repo.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiConsumer api;

  RegisterRepoImpl(this.api);

  @override
  Future<Either<ServerException, RegisterSuccessModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.register,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );

      final successModel = RegisterSuccessModel.fromJson(response);
      return Right(successModel);
    } on ServerException catch (e) {
      return Left(e);
    }
  }
}
