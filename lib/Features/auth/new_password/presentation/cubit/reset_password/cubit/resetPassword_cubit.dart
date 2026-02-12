import 'package:accessories_store/features/auth/new_password/data/repo/reset_password/reset_password_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resetPassword_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo}) : super(ResetPasswordInitialState());

  final ResetPasswordRepo resetPasswordRepo ;


  Future<void> resetPassword({required String email,required String password,required String otp})async{
    emit(ResetPasswordLoadingState());
    var result =await resetPasswordRepo.resetPassword(email: email, password: password, otp: otp);
    return result.fold((failure) => emit(ResetPasswordFailureState(message: failure.message)), (message) => emit(ResetPasswordSuccessState(message: message)));
  }
  
}
