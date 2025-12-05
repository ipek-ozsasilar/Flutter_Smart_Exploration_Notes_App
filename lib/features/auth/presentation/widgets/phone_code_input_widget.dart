import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_exploration_notes/core/constants/app_gradients.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class PhoneCodeInputWidget extends StatelessWidget {
  PhoneCodeInputWidget({super.key});
  final Color borderColor = AppColors.white.withOpacity(0.2);
  final double borderWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => Container(
          width: AppSizesEnum.phoneCodeInputContainerWidth.value,
          height: AppSizesEnum.phoneCodeInputContainerHeight.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
            gradient: AppGradients.instance.phoneCodeInputContainerGradient,
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: <BoxShadow>[_boxDecoration()],
          ),
          child: PhoneCodeInputItemWidget(index: index),
        ),
      ),
    );
  }

  BoxShadow _boxDecoration() {
    final Color color = AppColors.black.withOpacity(0.1);
    final double blurRadius = 8;
    final Offset offset = const Offset(0, 4);
    return BoxShadow(color: color, blurRadius: blurRadius, offset: offset);
  }
}

class PhoneCodeInputItemWidget extends StatefulWidget {
  const PhoneCodeInputItemWidget({super.key, required this.index});
  final int index;

  @override
  State<PhoneCodeInputItemWidget> createState() =>
      _PhoneCodeInputItemWidgetState();
}

class _PhoneCodeInputItemWidgetState extends State<PhoneCodeInputItemWidget> {
  final List<TextEditingController> _codeControllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final TextAlign textAlign = TextAlign.center;
  final TextInputType keyboardType = TextInputType.number;
  final int maxLength = 1;
  final double letterSpacing = 2;
  @override
  void initState() {
    super.initState();
    for (final controller in _codeControllers) {
      controller.addListener(() {
        if (controller.text.length == 1) {
          _focusNodes[controller.text.length - 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _codeControllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _codeControllers[widget.index],
      focusNode: _focusNodes[widget.index],
      textAlign: textAlign,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: TextStyle(
        color: AppColors.white,
        fontSize: AppSizesText.phoneCodeInputItemFontSize.value,
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacing.toDouble(),
      ),
      decoration: _inputDecoration(),
      onChanged: (String value) => _onCodeChanged(widget.index, value),
    );
  }

  void _onCodeChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  InputDecoration _inputDecoration() {
    final double width = 2.5;
    return InputDecoration(
      counterText: '',
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
        borderSide: BorderSide(color: AppColors.sliderGreen, width: width),
      ),
    );
  }
}
