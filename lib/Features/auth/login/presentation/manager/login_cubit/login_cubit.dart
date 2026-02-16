import 'package:accessories_store/Features/auth/login/data/models/login_success_model.dart';
import 'package:accessories_store/Features/auth/login/data/repos/login_repo.dart';
import 'package:accessories_store/core/services/google_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await loginRepo.login(email: email, password: password);

    result.fold(
      (failure) {
        emit(LoginError(message: failure.errModel.errorMessage));
      },
      (success) {
        emit(LoginSuccess(loginSuccessModel: success));
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(GoogleLoginLoading());
    final googleService = GoogleAuthService();
    final idToken = await googleService.signIn();

    if (idToken == null) {
      emit(const GoogleLoginError(message: 'Google login was cancelled'));
      return;
    }

    final result = await loginRepo.loginWithGoogle(idToken: idToken);
    result.fold(
      (failure) {
        emit(GoogleLoginError(message: failure.errModel.errorMessage));
      },
      (success) {
        emit(GoogleLoginSuccess(loginSuccessModel: success));
      },
    );
  }
}
