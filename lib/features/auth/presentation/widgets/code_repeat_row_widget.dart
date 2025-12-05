import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';

class CodeRepeatSendRowWidget extends StatefulWidget {
  const CodeRepeatSendRowWidget({
    super.key,
    required this.isResending,
    required this.countdown,
  });
  final bool isResending;
  final int countdown;

  @override
  State<CodeRepeatSendRowWidget> createState() =>
      _CodeRepeatSendRowWidgetState();
}

class _CodeRepeatSendRowWidgetState extends State<CodeRepeatSendRowWidget> {
  late bool _isResending;
  late int _countdown;

  @override
  void initState() {
    super.initState();
    _isResending = widget.isResending;
    _countdown = widget.countdown;
  }

  @override
  Widget build(BuildContext context) {
    final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
    return Container(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: <Widget>[
          BodyMediumText(
            text: AppStringsEnum.phoneVerificationCodeNotReceived.value,
          ),
          if (_countdown > 0)
            _TimeContainerWidget(context)
          else
            GeneralTextButton(
              text: AppStringsEnum.phoneVerificationCodeNotReceived.value,
              onPressed: _isResending
                  ? () {}
                  : () {
                      setState(() {
                        _isResending = true;
                        _countdown = 60;
                      });
                      Future<void>.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          _isResending = false;
                        });
                      });
                    },
            ),
        ],
      ),
    );
  }

  Container _TimeContainerWidget(BuildContext context) {
    final Color color = Colors.white.withOpacity(0.1);
    final FontWeight fontWeight = FontWeight.w600;
    return Container(
      padding: AppPaddings.codeRepeatRowTimeContainerPadding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSizesRadius.chip.value),
      ),
      child: BodyMediumText(text: '$_countdown seconds'),
    );
  }
}
