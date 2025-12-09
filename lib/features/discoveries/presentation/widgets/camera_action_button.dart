import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/service_locator/camera_service.dart';
import 'package:smart_exploration_notes/service_locator/service_locator.dart';
import 'dart:io';

class CameraActionButton extends StatelessWidget {
  CameraActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.source,
    required this.errorMessage,
    required this.onPicked,
  });

  final IconData icon;
  final String label;
  final bool isPrimary;
  final ImageSource source;
  final String errorMessage;
  final ValueChanged<File> onPicked;
  final Color color1 = AppColors.white.withOpacity(0.2);
  final Color color2 = AppColors.white.withOpacity(0.1);
  final Color color3 = AppColors.white.withOpacity(0.4);
  final Color color4 = AppColors.white.withOpacity(0.2);
  final double borderWidth = 1.5;
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSizesEnum.splashViewCubeInnerSize.value,
        decoration: BoxDecoration(
          color: isPrimary ? color1 : color2,
          borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
          border: Border.all(
            color: isPrimary ? color3 : color4,
            width: borderWidth,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              try {
                final XFile? image = await getItInstance<CameraProcess>()
                    .openCameraAndGallery(source, errorMessage);
                if (image != null) {
                  onPicked(File(image.path));
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: BodyMediumText(text: e.toString())),
                );
              }
            },
            borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
            child: Column(
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                IconWidget(
                  icon: icon,
                  size: AppSizesIcon.cameraPlaceholderIconSize.value,
                  color: AppColors.white,
                ),

                Padding(
                  padding: AppPaddings.categoryCardArrowSpacing,
                  child: NormalText(label: label, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
