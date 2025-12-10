import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_exploration_notes/core/constants/app_paddings.dart';
import 'package:smart_exploration_notes/core/enums/app_sizes_enum.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/icon_widget.dart';
import 'package:smart_exploration_notes/core/presentation/widgets/text_widget.dart';
import 'package:smart_exploration_notes/gen/colors.gen.dart';
import 'package:smart_exploration_notes/service_locator/camera_service.dart';
import 'package:smart_exploration_notes/service_locator/service_locator.dart';

// ML Kit object detection servisimiz.
import 'package:smart_exploration_notes/service_locator/object_detection_service.dart';

// ML Kit’in döndürdüğü DetectedObject tipi.
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class CameraActionButton extends StatefulWidget {
  const CameraActionButton({
    required this.icon,
    required this.label,
    required this.isPrimary,
    required this.source,
    required this.errorMessage,
    required this.onPicked,

    // Object detection sonucunu üst katmana iletmek için opsiyonel callback.
    // Mevcut kodu bozmamak için optional bıraktık.
    this.onDetected,
    super.key,
  });

  final IconData icon;
  final String label;
  final bool isPrimary;
  final ImageSource source;
  final String errorMessage;

  // Fotoğraf seçilince/çekilince dosyayı üst katmana vermek için.
  final ValueChanged<File> onPicked;

  // ML Kit tespit sonucunu üst katmana vermek için.
  final ValueChanged<List<DetectedObject>>? onDetected;

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

  // Object detection servis instance'ı.
  late final ObjectDetectionService detectionInstance;

  @override
  void initState() {
    super.initState();

    // DI üzerinden (getIt) object detection servisini alıyoruz.
    // Böylece detektör her buton tıklamasında yeniden oluşmaz.
    detectionInstance = getItInstance<ObjectDetectionService>();
  }

  /// Seçilen görüntüde ML Kit ile nesne tespiti yapar.
  /// Sonucu hem üst katmana iletir hem de dosyayı onPicked ile döner.
  Future<void> _runDetection(File file) async {

    // ML Kit tespit işlemini tetikliyoruz ve sonucu alıyoruz.
    final List<DetectedObject> objects =
        await detectionInstance.detectFromFile(file);

    // Widget hala ekranda mı kontrolü (async sonrası güvenli setState/callback için).
    if (!mounted) return;

    // Eğer üst katman detection sonucunu isterse, burada gönderiyoruz.
    // Böylece tespit sonucu boşa gitmiyor (önceki mantık hatası düzeldi).
    if (widget.onDetected != null) {
      widget.onDetected!(objects);
    }

    // Sistemde eski akış bozulmasın diye dosyayı yine üst katmana veriyoruz.
    widget.onPicked(file);
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

                // Kamera veya galeri seçimini yapan servis.
                // source parametresi ImageSource.camera / ImageSource.gallery geliyor.
                final XFile? image = await getItInstance<CameraProcess>()
                    .openCameraAndGallery(widget.source, widget.errorMessage);

                // Kullanıcı bir foto seçtiyse / çektiyse:
                if (image != null) {

                  // Seçilen fotoğrafı File'a çevirip ML Kit tespitine sokuyoruz.
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