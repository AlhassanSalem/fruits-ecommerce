import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/routing/routes.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signin/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInButtonBlocConsumer extends StatelessWidget {
  const SignInButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listenWhen: (previous, current) {
        return previous is SigninLoading != current is SigninLoading ||
            previous is SigninSuccess != current is SigninSuccess ||
            previous is SigninFailure != current is SigninFailure;
      },
      listener: (context, state) {
        if (state is SigninSuccess) {
          context.successSnackBar(message: 'successfully logged in');
          context.pushReplacementNamed(Routes.mainView);
        } else if (state is SigninFailure) {
          context.errorSnackBar(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is SigninLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return CustomButton(
          title: LocaleKeys.login,
          onPressed: () => _validateAndLogin(context),
        );
      },
    );
  }

  void _validateAndLogin(BuildContext context) {
    final signinCubit = context.read<SigninCubit>();
    if (signinCubit.signinFormKey.currentState!.validate()) {
      signinCubit.signInWithEmailAndPassword();
    }
  }
}
