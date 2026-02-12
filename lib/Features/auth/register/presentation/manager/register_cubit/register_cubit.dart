import 'package:accessories_store/Features/auth/register/data/repos/register_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    final result = await registerRepo.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        emit(RegisterError(message: failure.errModel.errorMessage));
      },
      (successModel) {
        emit(RegisterSuccess(message: successModel.message));
      },
    );
  }
}
