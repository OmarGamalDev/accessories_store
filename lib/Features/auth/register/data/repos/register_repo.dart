import 'package:accessories_store/Features/auth/register/data/models/register_success_model.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<ServerException, RegisterSuccessModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}
