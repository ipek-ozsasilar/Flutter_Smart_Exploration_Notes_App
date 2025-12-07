import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/hero_stat_card.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/slider_colorful_container.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/forgot_reset_icon_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/forgot_password_form_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/forgot_password_email_sent_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';

/// Şifre sıfırlama ekranı
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _emailSent = false;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch;

  @override
  void dispose() {
    _emailController.dispose();
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
                      title: AppStringsEnum.forgotPasswordTitle.value,
                      subtitle: AppStringsEnum.forgotPasswordDescription.value,
                      icon: AppIcons.instance.lockReset,
                      colors: [AppColors.sliderOrange, AppColors.cubixRed],
                    ),
                  ),

                  // İkon container
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: ForgotResetIconWidget(),
                  ),

                  // forgot password title
                  HeadlineSmallText(text: AppStringsEnum.forgotPassword.value, fontSize: AppSizesText.headlineSmallFontSize.value),

                  // forgot password description
                  Padding(
                    padding: AppPaddings.createAccountDescriptionPadding,
                    child: BodyMediumText(
                      text: _emailSent
                          ? AppStringsEnum.forgotPasswordEmailSent.value
                          : AppStringsEnum.forgotPasswordEnterEmail.value,
                    ),
                  ),

                  if (!_emailSent)
                    ForgotPasswordFormWidget(
                      emailController: _emailController,
                      formKey: _formKey,
                      onSendPressed: () {
                        setState(() {
                          _emailSent = true;
                        });
                      },
                    )
                  else
                    const ForgotPasswordEmailSentWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
