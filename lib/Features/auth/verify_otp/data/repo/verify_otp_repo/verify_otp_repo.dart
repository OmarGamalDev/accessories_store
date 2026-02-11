import 'package:accessories_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class VerifyOtpRepo {
  Future<Either<Failure,String>> verifyOtp({required String otp,required String email});
}