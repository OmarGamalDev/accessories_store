import 'package:accessories_store/features/auth/verify_email/data/repo/verify_email_repo/verify_email_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit({required this.verifyEmailRepo,}) : super(VerifyEmailInitialState());

  final VerifyEmailRepo verifyEmailRepo;

  Future<void> verifyEmail({required String email,required String otp}) async {
    emit(VerifyEmailLoadingState());
    var result = await verifyEmailRepo.verifyEmail(email: email,otp: otp);
    return result.fold((failure) => emit(VerifyEmailFailureState(errorMessage: failure.message)), (message) => emit(VerifyEmailSuccessState(message: message)));
  }

}
