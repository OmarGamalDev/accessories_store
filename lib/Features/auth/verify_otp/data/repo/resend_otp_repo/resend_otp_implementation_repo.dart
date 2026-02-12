import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/errors/failures.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:accessories_store/features/auth/verify_otp/data/repo/resend_otp_repo/resend_otp_repo.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class ResendOtpImplementationRepo implements ResendOtpRepo {
  final ApiConsumer apiConsumer;

  ResendOtpImplementationRepo({required this.apiConsumer});
  @override
  Future<Either<Failure, String>> resendOtp({required String email}) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.resendOtp,
        data: {"email": email},
      );
      return Right(response.toString());
    } on ServerException {
      return Left(ServerFailure(LocaleKeys.errorMessage.tr()));
    } catch (e) {
      return Left(ServerFailure(LocaleKeys.errorMessage.tr()));
    }
  }
}
