import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_button.dart';
import 'package:ecommerce_fruits/features/auth/presentaion/cubits/signup/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButtonBlocConsumer extends StatelessWidget {
  const SignupButtonBlocConsumer({super.key, required this.isAcceptedTermsAndConditions});
  final bool isAcceptedTermsAndConditions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listenWhen: (previous, current) {
                return previous.isLoading != current.isLoading ||
                       previous.isSuccess != current.isSuccess ||
                       previous.message != current.message;
              },
              listener: (context, state) {
                if (state.isSuccess && state.user != null) {
                  context.pop();
                } else if (state.message != null) {
                  context.errorSnackBar(
                    message: state.message!,
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  title: LocaleKeys.createNewAccount,
                  onPressed: () => _validateAndSignup(context),
                );
              },
            );
  }

  void _validateAndSignup(BuildContext context) {
    final signupCubit = context.read<SignupCubit>();
    if(signupCubit.signupFormKey.currentState!.validate() && signupCubit.state.isTermsAccepted) {
      signupCubit.createUserWithEmailAndPassword();
    }
  }
}

