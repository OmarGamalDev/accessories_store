part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

// Normal login states
final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginSuccessModel loginSuccessModel;
  const LoginSuccess({required this.loginSuccessModel});
}

final class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});
  @override
  List<Object> get props => [message];
}

// Google login states
final class GoogleLoginLoading extends LoginState {}

final class GoogleLoginSuccess extends LoginState {
  final LoginSuccessModel loginSuccessModel;
  const GoogleLoginSuccess({required this.loginSuccessModel});
}

final class GoogleLoginError extends LoginState {
  final String message;
  const GoogleLoginError({required this.message});
  @override
  List<Object> get props => [message];
}
