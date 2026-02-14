import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<ServerException, void>> login({
    required String email,
    required String password,
  });

  Future<Either<ServerException, void>> loginWithGoogle();
}
