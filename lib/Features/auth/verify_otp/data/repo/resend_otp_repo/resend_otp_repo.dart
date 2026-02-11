import 'package:accessories_store/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ResendOtpRepo {
  Future<Either<Failure,String>> resendOtp({required String email});
}