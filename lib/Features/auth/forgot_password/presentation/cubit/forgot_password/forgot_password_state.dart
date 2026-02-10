part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitialState extends ForgotPasswordState {}
final class ForgotPasswordLoadingState extends ForgotPasswordState {}
final class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordSuccessState({required this.message});
}
final class ForgotPasswordFailureState extends ForgotPasswordState {
  final String errorMessage;
  const ForgotPasswordFailureState({required this.errorMessage});
}
