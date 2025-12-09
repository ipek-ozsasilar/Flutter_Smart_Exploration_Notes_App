import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/input_text_form.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/or_divider_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/slider_colorful_container.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/forgot_password_view.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/register_view.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/login_door_widget.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';

//Login Screen
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch;

    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppPaddings.loginViewGeneralPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  // Üstte renkli çizgi
                  Padding(
                    padding: AppPaddings.loginSliderContainerPadding,
                    child: SliderColorfulContainer(
                      gradient: AppGradients
                          .instance
                          .loginSliderColorfulContainerGradient,
                    ),
                  ),

                  // İkon login
                  LoginDoorWidget(),

                  //welcome text
                  Padding(
                    padding: AppPaddings.loginWelcomeTextPadding,
                    child: HeadlineSmallText(
                      text: AppStringsEnum.welcome.value,
                      fontSize: AppSizesText.headlineSmallFontSize.value,
                    ),
                  ),

                  //welcome description text
                  BodyMediumText(text: AppStringsEnum.welcomeDescription.value),

                  Padding(
                    padding: AppPaddings.loginEmailPadding,
                    child: InputTextForm(
                      controller: _emailController,
                      label: AppStringsEnum.email.value,
                    ),
                  ),
                  InputTextForm(
                    controller: _passwordController,
                    label: AppStringsEnum.password.value,
                  ),

                  //forgot password text button
                  Align(
                    alignment: Alignment.centerRight,
                    child: GeneralTextButton(
                      text: AppStringsEnum.forgotPassword.value,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (BuildContext context) => const ForgotPasswordView()),
                        );
                      },
                    ),
                  ),

                  //login button
                  Padding(
                    padding: AppPaddings.loginButtonPadding,
                    child: GeneralElevatedButton(formKey: _formKey, text: AppStringsEnum.login.value),
                  ),

                  //or divider
                  OrDividerWidget(),

                  //google login button
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: GeneralOutlinedIconButton(text: AppStringsEnum.googleLogin.value),
                  ),

                  //do you have an account text and register text button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BodyMediumText(
                        text: AppStringsEnum.doYouHaveAnAccount.value,
                      ),
                      GeneralTextButton(
                        text: AppStringsEnum.register.value,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(builder: (BuildContext context) => const RegisterView()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
