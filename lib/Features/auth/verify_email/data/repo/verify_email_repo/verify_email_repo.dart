import 'package:accessories_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class VerifyEmailRepo {
  Future<Either<Failure, String>> verifyEmail({required String email,required String otp});
}
