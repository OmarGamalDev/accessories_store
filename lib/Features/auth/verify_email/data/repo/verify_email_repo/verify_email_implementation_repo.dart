import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/errors/failures.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:accessories_store/features/auth/verify_email/data/repo/verify_email_repo/verify_email_repo.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class VerifyEmailImplementationRepo implements VerifyEmailRepo{
  final ApiConsumer apiConsumer;
  VerifyEmailImplementationRepo({required this.apiConsumer});
  @override
  Future<Either<Failure, String>> verifyEmail({
  required String email,
  required String otp
}) async {
  try {
    final response = await apiConsumer.post(
      EndPoint.verifyEmail,
      data: {
        "email": email.trim(),
        "otp":otp
      },
    );

    return Right(response.toString());

  } on ServerException catch (e) {
    return Left(ServerFailure(e.errModel.errorMessage));
  } catch (e) {
    return Left(ServerFailure(LocaleKeys.errorMessage.tr()));
  }
}

}