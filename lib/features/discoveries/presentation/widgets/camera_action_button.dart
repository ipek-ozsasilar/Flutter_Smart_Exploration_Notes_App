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
import 'package:smart_exploration_notes/service_locator/object_detection_service.dart';

class CameraActionButton extends StatefulWidget {
  const CameraActionButton({
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.source,
    required this.errorMessage,
    required this.onPicked,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool isPrimary;
  final ImageSource source;
  final String errorMessage;
  final ValueChanged<File> onPicked;

  @override
  State<CameraActionButton> createState() => _CameraActionButtonState();
}

class _CameraActionButtonState extends State<CameraActionButton> {
  final Color color1 = AppColors.white.withValues(alpha: 0.2);

  final Color color2 = AppColors.white.withValues(alpha: 0.1);

  final Color color3 = AppColors.white.withValues(alpha: 0.4);

  final Color color4 = AppColors.white.withValues(alpha: 0.2);

  final double borderWidth = 1.5;

  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  late final ObjectDetectionService detectionInstance;

  @override
  void initState() {
    super.initState();
    detectionInstance = getItInstance<ObjectDetectionService>();
  }

  Future<void> _runDetection(File file) async {
    setState(() {
      _loading = true;
      _image = file;
      _objects = [];
    });

    final objects = await detectionInstance.detectFromFile(file);

    setState(() {
      _objects = objects;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSizesEnum.splashViewCubeInnerSize.value,
        decoration: BoxDecoration(
          color: widget.isPrimary ? color1 : color2,
          borderRadius: BorderRadius.circular(AppSizesRadius.button.value),
          border: Border.all(
            color: widget.isPrimary ? color3 : color4,
            width: borderWidth,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              try {
                final XFile? image = await getItInstance<CameraProcess>()
                    .openCameraAndGallery(widget.source, widget.errorMessage);
                if (!mounted) return;
                if (image != null) {
                  await _runDetection(File(image.path));
                }
              } catch (e) {
                if (!mounted) return;
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
                  icon: widget.icon,
                  size: AppSizesIcon.cameraPlaceholderIconSize.value,
                  color: AppColors.white,
                ),

                Padding(
                  padding: AppPaddings.categoryCardArrowSpacing,
                  child: NormalText(
                    label: widget.label,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
