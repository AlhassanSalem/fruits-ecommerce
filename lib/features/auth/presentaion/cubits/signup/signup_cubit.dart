import 'dart:developer';

import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(const SignupState());
  final AuthRepo authRepo;


  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  /// Toggles the acceptance of terms and conditions.
  /// This method updates the state to reflect whether the terms are accepted or not.
  void toggleTermsAccepted() {
    emit(state.copyWith(isTermsAccepted: !state.isTermsAccepted));
    log('Toggling terms accepted: ${state.isTermsAccepted}');
  }

  /// Creates a new user with the provided email, password, and full name.
  Future<void> createUserWithEmailAndPassword() async {
    emit(state.copyWith(isLoading: true));
    final result = await authRepo.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
      name: fullNameController.text,
    );

    result.fold(
      (failure) => emit(state.copyWith(message: failure.message, isLoading: false)),
      (user) => emit(state.copyWith(user: user, isSuccess: true, isLoading: false)),
    );
  }
}
