import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/hero_stat_card.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/input_text_form.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/slider_colorful_container.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/core/validators/auth_validators.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/login_view.dart';
import 'package:smart_exploration_notes/features/auth/presentation/pages/widgets/register_person_icon_widget.dart';

/// Kayıt olma ekranı
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final double blurRadius = 20;
  final double spreadRadius = 2;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: AppPaddings.loginViewGeneralPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: <Widget>[
                  // Üstte renkli çizgi
                  Padding(
                    padding: AppPaddings.loginSliderContainerPadding,
                    child: SliderColorfulContainer(
                      gradient: AppGradients
                          .instance
                          .loginSliderColorfulContainerGradient,
                    ),
                  ),

                  // Hero stat card
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: HeroStatCard(
                      title: AppStringsEnum.createPersonalDiscoveryNote.value,
                      subtitle: AppStringsEnum.locationPhotoAITagsReady.value,
                      icon: AppIcons.flag,
                    ),
                  ),

                  // person add icon container
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: RegisterPersonIconWidget(
                      blurRadius: blurRadius,
                      spreadRadius: spreadRadius,
                    ),
                  ),

                  // create account text
                  HeadlineSmallText(text: AppStringsEnum.createAccount.value),

                  // create account description text
                  Padding(
                    padding: AppPaddings.createAccountDescriptionPadding,
                    child: BodyMediumText(
                      text: AppStringsEnum.createAccountDescription.value,
                    ),
                  ),

                  // name input text form
                  InputTextForm(
                    controller: _nameController,
                    label: AppStringsEnum.name.value,
                    icon: AppIcons.person,
                    validator: AuthValidators.instance.validateName,
                  ),

                  // email input text form
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: InputTextForm(
                      controller: _emailController,
                      label: AppStringsEnum.email.value,
                      keyboardType: TextInputType.emailAddress,
                      validator: AuthValidators.instance.validateEmail,
                    ),
                  ),

                  // phone input text form
                  InputTextForm(
                    controller: _phoneController,
                    label: AppStringsEnum.phone.value,
                    hintText: AppStringsEnum.phoneHintText.value,
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: AuthValidators.instance.validatePhone,
                  ),

                  // password input text form
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: InputTextForm(
                      controller: _passwordController,
                      label: AppStringsEnum.password.value,
                      validator: AuthValidators.instance.validatePassword,
                    ),
                  ),

                  // confirm password input text form
                  InputTextForm(
                    controller: _confirmPasswordController,
                    label: AppStringsEnum.confirmPassword.value,
                    validator: (String? value) =>
                        AuthValidators.instance.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                  ),

                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: GeneralElevatedButton(formKey: _formKey),
                  ),

                  Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: <Widget>[
                      BodyMediumText(
                        text: AppStringsEnum.alreadyHaveAnAccount.value,
                      ),
                      GeneralTextButton(
                        text: AppStringsEnum.login.value,
                        widget: const LoginView(),
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
