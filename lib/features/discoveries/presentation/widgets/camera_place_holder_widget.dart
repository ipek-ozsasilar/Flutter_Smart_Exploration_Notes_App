import 'dart:io';
import 'package:flutter/material.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/camera_action_button.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/core/constants/app_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';

class CameraPlaceholderWidget extends StatefulWidget {
  const CameraPlaceholderWidget({super.key, required this.onImagePicked});

  /// Üst widget'a seçilen/çekilen resmi iletir
  final ValueChanged<File> onImagePicked;

  @override
  State<CameraPlaceholderWidget> createState() =>
      _CameraPlaceholderWidgetState();
}

class _CameraPlaceholderWidgetState extends State<CameraPlaceholderWidget> {
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final Color color = AppColors.white.withOpacity(0.9);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPaddings.loginViewGeneralPadding,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: <Widget>[
            /// Ana ikon
            Container(
              width: AppSizesRadius.cameraPlaceholderIconSize.value,
              height: AppSizesRadius.cameraPlaceholderIconSize.value,
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: IconWidget(
                icon: AppIcons.instance.capture,
                size: AppSizesIcon.cameraPlaceholderIconSize.value,
                color: color,
              ),
            ),

            /// Açıklama metni
            Padding(
              padding: AppPaddings.cameraPlaceholderPadding,
              child: NormalText(
                label: AppStringsEnum.capturePhotoDescription.value,
                fontWeight: FontWeight.w500,
              ),
            ),

            /// Butonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CameraActionButton(
                  icon: AppIcons.instance.camera,
                  label: AppStringsEnum.takePhoto.value,
                  isPrimary: true,
                  source: ImageSource.camera,
                  errorMessage: AppErrorStringsEnum.cameraError.value,
                  onPicked: (File file) => widget.onImagePicked(file),
                ),
                const SizedBox(width: 16),
                CameraActionButton(
                  icon: AppIcons.instance.gallery,
                  label: AppStringsEnum.selectFromGallery.value,
                  isPrimary: false,
                  source: ImageSource.gallery,
                  errorMessage: AppErrorStringsEnum.galleryError.value,
                  onPicked: (File file) => widget.onImagePicked(file),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
