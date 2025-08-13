part of 'signin_cubit.dart';


@immutable
sealed class SigninState {
  const SigninState();
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final UserEntity user;

  const SigninSuccess(this.user);
}

class SigninFailure extends SigninState {
  final String message;

  const SigninFailure(this.message);
}
