import 'package:accessories_store/features/auth/forgot_password/data/repo/forgot_password_repo/forgot_password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.forgotPasswordRepo}) : super(ForgotPasswordInitialState());

  final ForgotPasswordRepo forgotPasswordRepo;

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoadingState());
    var result = await forgotPasswordRepo.forgotPassword(email: email);
    return result.fold((failure) => emit(ForgotPasswordFailureState(errorMessage: failure.message)), (message) => emit(ForgotPasswordSuccessState(message: message)));
  }

}
