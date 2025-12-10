import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/validators/auth_validators.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class InputTextForm extends StatefulWidget {
  const InputTextForm({
    required this.controller, required this.label, super.key,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.icon,
    this.passwordController,
  });
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final IconData? icon;
  final TextEditingController? passwordController;

  @override
  State<InputTextForm> createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  late bool _obscureText;
  bool get _isEmailField => widget.label == AppStringsEnum.email.value;
  bool get _isPasswordField => widget.label == AppStringsEnum.password.value;
  bool get _isConfirmPasswordField =>
      widget.label == AppStringsEnum.confirmPassword.value;
  bool get _isNameField => widget.label == AppStringsEnum.name.value;
  bool get _isPhoneField => widget.label == AppStringsEnum.phone.value;

  final bool filled = true;
  final Color fillColor = AppColors.white.withValues(alpha: 0.1);
  final Color prefixIconColor = AppColors.sliderBlue.withValues(alpha: 0.2);
  final Color hintStyleColor = AppColors.white.withValues(alpha: 0.4);
  final Color labelStyleColor = Colors.white70;
  final FontWeight errorStyleFontWeight = FontWeight.w600;
  final double focusedBorderWidth = 2;
  @override
  void initState() {
    super.initState();
    _obscureText = _isEmailField || _isNameField || _isPhoneField
        ? false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType:
          widget.keyboardType ??
          (_isEmailField
              ? TextInputType.emailAddress
              : _isPhoneField
              ? TextInputType.phone
              : _isPasswordField
              ? TextInputType.number
              : TextInputType.text),

      inputFormatters: _isEmailField
          ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'))]
          : _isPasswordField
          ? [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ]
          : null,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hintStyleColor),
        labelStyle: TextStyle(color: labelStyleColor),
        errorStyle: TextStyle(
          color: AppColors.amberAccent,
          fontWeight: errorStyleFontWeight,
        ),
        prefixIcon: _prefixIconWidget(),
        suffixIcon: _suffixIconWidget(),
        filled: filled,
        fillColor: fillColor,
        border: _borderMethod(),
        enabledBorder: _enableBorderMethod(),
        focusedBorder: _focusedBorderMethod(),
      ),
      validator:
          widget.validator ??
          (_isEmailField
              ? AuthValidators.instance.validateEmail
              : _isPasswordField
              ? AuthValidators.instance.validatePassword
              : _isNameField
              ? AuthValidators.instance.validateName
              : _isPhoneField
              ? AuthValidators.instance.validatePhone
              : null),
    );
  }

  OutlineInputBorder _focusedBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide(
        color: AppColors.sliderBlue,
        width: focusedBorderWidth,
      ),
    );
  }

  OutlineInputBorder _enableBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide(color: AppColors.white.withValues(alpha: 0.2)),
    );
  }

  OutlineInputBorder _borderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide.none,
    );
  }

  Container _prefixIconWidget() {
    IconData iconData;
    if (widget.icon != null) {
      iconData = widget.icon!;
    } else if (_isEmailField) {
      iconData = AppIcons.instance.email;
    } else if (_isPasswordField) {
      iconData = AppIcons.instance.password;
    } else if (_isNameField) {
      iconData = Icons.person_outline;
    } else if (_isPhoneField) {
      iconData = Icons.phone_outlined;
    } else {
      iconData = AppIcons.instance.email;
    }

    return Container(
      margin: AppPaddings.inputTextFormPrefixIconPadding,
      decoration: BoxDecoration(
        color: prefixIconColor,
        borderRadius: BorderRadius.circular(AppSizesRadius.chip.value),
      ),
      child: IconWidget(
        icon: iconData,
        color: AppColors.sliderBlue,
        size: AppSizesIcon.inputTextFormIconSize.value,
      ),
    );
  }

  Widget? _suffixIconWidget() {
    // Sadece password ve confirm password field'larÄ± iÃ§in visibility icon gÃ¶ster
    if (_isPasswordField || _isConfirmPasswordField) {
      return GeneralIconButton(
        icon: _obscureText ? AppIcons.instance.visibility : AppIcons.instance.visibilityOff,
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        color: Colors.white70,
      );
    }
    // DiÄŸer tÃ¼m field'lar iÃ§in null dÃ¶ndÃ¼r
    return null;
  }
}

