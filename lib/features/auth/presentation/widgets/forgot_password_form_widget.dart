import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/input_text_form.dart';
import 'package:smart_exploration_notes/core/validators/auth_validators.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({
    required this.emailController, required this.formKey, required this.onSendPressed, super.key,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onSendPressed;

  @override
  Widget build(BuildContext context) {
    final Color shadowColor = AppColors.sliderOrange.withValues(alpha: 0.4);
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Padding(
          padding: AppPaddings.loginEmailPadding,
          child: InputTextForm(
            controller: emailController,
            label: AppStringsEnum.email.value,
            validator: AuthValidators.instance.validateEmail,
          ),
        ),
        Padding(
          padding: AppPaddings.loginButtonPadding,
          child: GeneralElevatedButton(
            formKey: formKey,
            text: AppStringsEnum.forgotPasswordSend.value,
            gradient: AppGradients.instance.forgotPasswordButtonGradient,
            shadowColor: shadowColor,
            onPressed: onSendPressed,
          ),
        ),
      ],
    );
  }
}

