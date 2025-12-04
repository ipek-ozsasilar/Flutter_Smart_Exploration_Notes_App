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
    super.key,
    required this.controller,
    required this.label,
  });
  final TextEditingController controller;
  final String label;

  @override
  State<InputTextForm> createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  late bool _obscureText;
  bool get _isEmailField => widget.label == AppStringsEnum.email.value;
  final bool filled = true;
  final Color fillColor = AppColors.white.withOpacity(0.1);
  final Color prefixIconColor = AppColors.sliderBlue.withOpacity(0.2);
  @override
  void initState() {
    super.initState();
    _obscureText = _isEmailField ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: _isEmailField
          ? TextInputType.emailAddress
          : TextInputType.number,
      inputFormatters: _isEmailField
          ? [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]'))]
          : [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(6),
            ],

      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.white70),
        errorStyle: TextStyle(
          color: AppColors.amberAccent,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: _prefixIconWidget(),
        suffixIcon: _suffixIconWidget(),
        filled: filled,
        fillColor: fillColor,
        border: _borderMethod(),
        enabledBorder: _enableBorderMethod(),
        focusedBorder: _focusedBorderMethod(),
      ),
      validator: _isEmailField
          ? AuthValidators.instance.validateEmail
          : AuthValidators.instance.validatePassword,
    );
  }

  OutlineInputBorder _focusedBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide(color: AppColors.sliderBlue, width: 2),
    );
  }

  OutlineInputBorder _enableBorderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide(color: AppColors.white.withOpacity(0.2)),
    );
  }

  OutlineInputBorder _borderMethod() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
      borderSide: BorderSide.none,
    );
  }

  Container _prefixIconWidget() {
    return Container(
      margin: AppPaddings.inputTextFormPrefixIconPadding,
      decoration: BoxDecoration(
        color: prefixIconColor,
        borderRadius: BorderRadius.circular(AppSizesRadius.chip.value),
      ),
      child: IconWidget(
        icon: _isEmailField ? AppIcons.email : AppIcons.password,
        color: AppColors.sliderBlue,
        size: AppSizesIcon.inputTextFormIconSize.value,
      ),
    );
  }

  Widget? _suffixIconWidget() {
    return _isEmailField
        ? null
        : GeneralIconButton(
            icon: _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            color: Colors.white70,
          );
  }
}
