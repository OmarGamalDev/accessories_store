part of 'verify_email_cubit.dart';

sealed class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

final class VerifyEmailInitialState extends VerifyEmailState {}
final class VerifyEmailLoadingState extends VerifyEmailState {}
final class VerifyEmailSuccessState extends VerifyEmailState {
  final String message;
  const VerifyEmailSuccessState({required this.message});
}
final class VerifyEmailFailureState extends VerifyEmailState {
  final String errorMessage;
  const VerifyEmailFailureState({required this.errorMessage});
}
