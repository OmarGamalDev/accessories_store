import 'package:accessories_store/Features/auth/new_password/data/repo/reset_password/reset_password_repo.dart';
import 'package:accessories_store/core/errors/exceptions.dart';
import 'package:accessories_store/core/errors/failures.dart';
import 'package:accessories_store/core/network/api_constants.dart';
import 'package:accessories_store/core/network/api_consumer.dart';
import 'package:accessories_store/generated/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

class RestPasswordImplementationRepo implements ResetPasswordRepo {
  final ApiConsumer apiConsumer;

  RestPasswordImplementationRepo({required this.apiConsumer});
  @override
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String password,
    required String otp,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.resetPassword,
        data: {"email": email, "otp": otp, "newPassword": password},
      );
      return Right(response.toString());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errModel.errorMessage));
    } catch (e) {
      return Left(ServerFailure(LocaleKeys.errorMessage.tr()));
    }
  }
}
