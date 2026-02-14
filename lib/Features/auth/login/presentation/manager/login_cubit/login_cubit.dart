import 'package:accessories_store/Features/auth/login/data/repos/login_repo.dart';
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
        emit(LoginSuccess());
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());

    final result = await loginRepo.loginWithGoogle();

    result.fold(
      (failure) {
        emit(LoginError(message: failure.errModel.errorMessage));
      },
      (success) {
        emit(LoginSuccess());
      },
    );
  }
}
