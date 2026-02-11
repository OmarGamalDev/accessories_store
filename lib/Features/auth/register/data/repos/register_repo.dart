import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<ServerException, void>> register({
    required String name,
    required String email,
    required String password,
  });
}
