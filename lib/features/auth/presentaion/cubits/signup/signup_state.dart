part of 'signup_cubit.dart';

class SignupState {
  final bool isTermsAccepted;
  final UserEntity? user;
  final String? message;
  final bool isLoading;
  final bool isSuccess;

  const SignupState({
    this.isTermsAccepted = false,
    this.user,
    this.message,
    this.isLoading = false,
    this.isSuccess = false,
  });

  SignupState copyWith({
    bool? isTermsAccepted,
    UserEntity? user,
    String? message,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return SignupState(
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
      user: user ?? this.user,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}


  
