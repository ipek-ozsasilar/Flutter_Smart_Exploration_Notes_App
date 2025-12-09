import 'package:image_picker/image_picker.dart';
import 'package:smart_exploration_notes/core/enums/app_strings_enum.dart';

class CameraProcess {
  /// Image picker instance'ı
  final ImagePicker _imagePicker = ImagePicker();

  /// Tekrar resim çek
  Future<void> retakePhoto() async {
    await openCameraAndGallery(
      ImageSource.camera,
      AppErrorStringsEnum.cameraError.value,
    );
  }

  /// Kamerayı aç
  Future<XFile?> openCameraAndGallery(
    ImageSource source,
    String? errorMessage,
  ) async {
    /// Kaynak kameraysa fotoğraf çek, galeriyse resim seç
    final XFile? image = await _imagePicker.pickImage(
      source: source,
      imageQuality: 85,
    );
    return image;
  }
}
