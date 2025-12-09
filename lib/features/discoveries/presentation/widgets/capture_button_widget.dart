import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/general_buttons.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/pages/map_view.dart';
import 'package:smart_exploration_notes/features/discoveries/presentation/widgets/capture_preview_image_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/service_locator/camera_service.dart';
import 'package:smart_exploration_notes/service_locator/service_locator.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';

class CapturePreviewWidget extends StatefulWidget {
  const CapturePreviewWidget({super.key, required this.capturedImage});
  final File capturedImage;

  @override
  State<CapturePreviewWidget> createState() => _CapturePreviewWidgetState();
}

class _CapturePreviewWidgetState extends State<CapturePreviewWidget> {
  late File _capturedImage;

  @override
  void initState() {
    super.initState();
    _capturedImage = widget.capturedImage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.loginViewGeneralPadding,
      child: Column(
        children: <Widget>[
          /// Resim önizlemesi
          Expanded(child: CapturePreviewImageWidget(image: _capturedImage)),

          /// Butonlar
          Padding(
            padding: AppPaddings.notificationsViewPadding,
            child: Row(
              children: <Widget>[
                /// Tekrar çek butonu
                Padding(
                  padding: AppPaddings.right8Padding,
                  child: Expanded(
                    child: PhotoActionButton(
                      icon: Icons.refresh_rounded,
                      label: AppStringsEnum.retakePhoto.value,
                      onPressed: () async {
                        try {
                          final XFile? image =
                              await getItInstance<CameraProcess>()
                                  .openCameraAndGallery(
                                    ImageSource.camera,
                                    AppErrorStringsEnum.cameraError.value,
                                  );

                          /// Seçilen/çekilen görsel varsa state'e yaz
                          if (image != null && mounted) {
                            setState(() {
                              _capturedImage = File(image.path);
                            });
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: BodyMediumText(text: e.toString()),
                                backgroundColor: AppColors.red,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),

                /// Galeriden seç butonu
                Padding(
                  padding: AppPaddings.right8Padding,
                  child: Expanded(
                    child: PhotoActionButton(
                      icon: Icons.photo_library_rounded,
                      label: AppStringsEnum.selectFromGallery.value,
                      onPressed: () async {
                        try {
                          final XFile? image =
                              await getItInstance<CameraProcess>()
                                  .openCameraAndGallery(
                                    ImageSource.gallery,
                                    AppErrorStringsEnum.galleryError.value,
                                  );

                          /// Seçilen/çekilen görsel varsa state'e yaz
                          if (image != null && mounted) {
                            setState(() {
                              _capturedImage = File(image.path);
                            });
                          }
                        } catch (e) {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: BodyMediumText(text: e.toString()),
                                backgroundColor: AppColors.red,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ),

                /// Kaydet butonu
                Expanded(
                  child: PhotoActionButton(
                    icon: Icons.check_rounded,
                    label: AppStringsEnum.savePhoto.value,
                    backgroundColor: AppColors.sliderBlue,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const MapView(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
