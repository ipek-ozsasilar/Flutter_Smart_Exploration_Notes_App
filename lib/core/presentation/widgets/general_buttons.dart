import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/home_view.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/map_view.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';

class GeneralOutlinedIconButton extends StatelessWidget {
  const GeneralOutlinedIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // Google ile giriş işlemi
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeView(),
          ),
        );
      },
      icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 28),
      label: const Text(
        'Google ile Giriş Yap',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide(color: Colors.white.withOpacity(0.3), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}

class GeneralElevatedButton extends StatelessWidget {
  const GeneralElevatedButton({
    super.key,
    required this.text,
    required GlobalKey<FormState> formKey,
    this.gradient,
    this.onPressed,
    this.shadowColor,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String text;
  final LinearGradient? gradient;
  final VoidCallback? onPressed;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final LinearGradient buttonGradient =
        gradient ?? AppGradients.instance.loginSliderColorfulContainerGradient;
    final Color shadowColorValue =
        shadowColor ?? AppColors.sliderBlue.withOpacity(0.4);

    return Container(
      decoration: BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        boxShadow: <BoxShadow>[
          _loginButtonContainerBoxShadow(shadowColorValue),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            if (onPressed != null) {
              onPressed!();
            } else {
              // Default: Giriş işlemi
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const HomeView(),
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.white,
          padding: AppPaddings.loginButtonInnerPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
          ),
        ),
        child: LoginAndGoogleLoginButtonText(text: text),
      ),
    );
  }

  BoxShadow _loginButtonContainerBoxShadow(Color color) {
    final Offset offset = const Offset(0, 8);

    return BoxShadow(
      color: color,
      blurRadius: AppSizesRadius.button.value,
      offset: offset,
    );
  }
}

class GeneralTextButton extends StatelessWidget {
  const GeneralTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: AppColors.sliderBlue)),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizesEnum.phoneCodeInputContainerHeight.value,
      height: AppSizesEnum.phoneCodeInputContainerHeight.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.instance.mapsFloatingActionButtonGradient,
        boxShadow: <BoxShadow>[_boxShadowMethod()],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const MapView(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(AppSizesRadius.card.value),
          child: IconWidget(
            icon: AppIcons.instance.add,
            color: AppColors.white,
            size: AppSizesIcon.homeBottomCardFlagIconSize.value,
          ),
        ),
      ),
    );
  }

  BoxShadow _boxShadowMethod() {
    final double blurRadius = 20;
    final double spreadRadius = 2;
    final Offset offset = const Offset(0, 8);
    final Color color = AppColors.sliderBlue.withOpacity(0.5);
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      offset: offset,
    );
  }
}

class GeneralIconButton extends StatefulWidget {
  const GeneralIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  State<GeneralIconButton> createState() => _GeneralIconButtonState();
}

class _GeneralIconButtonState extends State<GeneralIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.icon, color: widget.color),
      onPressed: widget.onPressed,
    );
  }
}
