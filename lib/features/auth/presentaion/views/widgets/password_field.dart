import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_fruits/core/helper/app_regex.dart';
import 'package:ecommerce_fruits/core/helper/extensions.dart';
import 'package:ecommerce_fruits/core/helper/locale_keys.dart';
import 'package:ecommerce_fruits/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: LocaleKeys.password,
      textInputType: TextInputType.visiblePassword,
      obscureText: obscureText,
      validator: (value) {
        if (value.isNullOrEmpty) {
          return LocaleKeys.pleaseEnterYourPassword.tr();
        } else if (!AppRegex.isValidPassword(value!)) {
          return LocaleKeys.errorValidPassword.tr();
        }
        return null;
      },
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: const Color(0xFFC9CECF),
        ),
      ),
    );
  }
}
