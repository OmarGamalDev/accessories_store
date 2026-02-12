import 'package:accessories_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, String>> resetPassword({required String email,required String password,required String otp});
}