import 'dart:developer';

import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Future<void> signInWithEmailAndPassword() async {
    emit(SigninLoading());
    
    final result = await authRepo.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    log("SignInCubit: signInWithEmailAndPassword called with email: ${emailController.text} and password: ${passwordController.text}");

    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }


  Future<void> signInWithGoogle() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithGoogle();
    log("SignInCubit: signInWithGoogle called");

    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());

    final result = await authRepo.signInWithFacebook();
    log("SignInCubit: signInWithFacebook called");

    result.fold(
      (failure) => emit(SigninFailure(failure.message)),
      (user) => emit(SigninSuccess(user)),
    );
  }
}
