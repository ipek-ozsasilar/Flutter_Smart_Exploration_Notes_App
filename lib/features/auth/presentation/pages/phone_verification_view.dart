import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/gradient_background.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/slider_colorful_container.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/phone_code_input_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/code_repeat_row_widget.dart';
import 'package:smart_exploration_notes/features/auth/presentation/widgets/phone_message_icon_widget.dart';

/// Telefon doğrulama ekranı (SMS kodu ile)
class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isResending = false;
  int _countdown = 60;
  final bool top = false;
  final CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.stretch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          top: top,
          child: SingleChildScrollView(
            padding: AppPaddings.loginViewGeneralPadding,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: <Widget>[
                  // Üstte renkli çizgi
                  Padding(
                    padding: AppPaddings
                        .phoneVerificationSliderColorfulContainerPadding,
                    child: SliderColorfulContainer(
                      gradient: AppGradients
                          .instance
                          .phoneVerificationSliderColorfulContainerGradient,
                    ),
                  ),

                  // İkon container
                  Padding(
                    padding: AppPaddings.loginButtonInnerPadding,
                    child: PhoneMessageIconWidget(),
                  ),

                  // Title and description
                  HeadlineSmallText(
                    text: AppStringsEnum.phoneVerification.value,
                    fontSize: AppSizesText.headlineSmallFontSize.value,
                  ),

                  Padding(
                    padding: AppPaddings.createAccountDescriptionPadding,
                    child: BodyMediumText(
                      text:
                          '${widget.phoneNumber} numarasına gönderilen 6 haneli kodu girin',
                    ),
                  ),

                  // Code input
                  PhoneCodeInputWidget(),

                  // Verify button
                  Padding(
                    padding: AppPaddings.loginButtonPadding,
                    child: GeneralElevatedButton(
                      text: AppStringsEnum.verify.value,
                      formKey: _formKey,
                    ),
                  ),

                  // Code repeat send row
                  CodeRepeatSendRowWidget(
                    isResending: _isResending,
                    countdown: _countdown,
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
