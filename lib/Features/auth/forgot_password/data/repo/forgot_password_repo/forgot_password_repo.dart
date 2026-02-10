import 'package:accessories_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, String>> forgotPassword({required String email});
}
