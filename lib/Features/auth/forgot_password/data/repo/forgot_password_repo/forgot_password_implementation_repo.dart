import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/errors/failures.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:accessories_store/features/auth/forgot_password/data/repo/forgot_password_repo/forgot_password_repo.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPasswordImplementationRepo implements ForgotPasswordRepo{
  final ApiConsumer apiConsumer;
  ForgotPasswordImplementationRepo({required this.apiConsumer});
  @override
  Future<Either<Failure, String>> forgotPassword({
  required String email,
}) async {
  try {
    final response = await apiConsumer.post(
      EndPoint.forgotPassword,
      data: {
        "email": email.trim(),
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