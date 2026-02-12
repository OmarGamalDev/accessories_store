part of 'resetPassword_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitialState extends ResetPasswordState {}
final class ResetPasswordLoadingState extends ResetPasswordState {}
final class ResetPasswordFailureState extends ResetPasswordState {
  final String message;
  const ResetPasswordFailureState({required this.message});
}
final class ResetPasswordSuccessState extends ResetPasswordState {
  final String message;

 const ResetPasswordSuccessState({required this.message});
}
