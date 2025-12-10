import 'dart:io';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

/// ML Kit Object Detector'ı yöneten servis.
///
/// Bu servis şunları yapar:
/// - ObjectDetector'ı tek bir yerde oluşturur.
/// - Fotoğraf verildiğinde ML Kit ile nesne tespiti yapar.
/// - Tespit sonuçlarını (DetectedObject listesi) geri döner.
///
/// Neden servis olarak ayrı?
/// - ObjectDetector oluşturmak maliyetli bir iştir.
/// - Her fotoğrafta yeniden oluşturmak yerine tek instance ile çalışmak performans sağlar.
/// - DI (getIt) ile uygulama genelinde aynı servisi kullanabilirsin.
class ObjectDetectionService {
  /// Servis oluşturulunca detektörü konfigure edip init ediyoruz.
  ObjectDetectionService() {

    // ML Kit detektörünün davranışını belirleyen opsiyonlar.
    final options = ObjectDetectorOptions(

      // Object detection modunu belirler:
      // - single: tek fotoğraf üzerinde tespit (senin senaryon)
      // - stream: canlı kamera akışındaki her frame'de tespit
      mode: DetectionMode.single,

      // Nesnelere label (etiket) üretmesini istiyorsak true.
      // Örn: "cat", "bottle" gibi sınıflar objects[i].labels içinde gelir.
      classifyObjects: true,

      // Fotoğrafta birden fazla nesne bulmasını istiyorsak true.
      // false olursa genelde tek bir baskın nesne döner.
      multipleObjects: true,
    );

    // Yukarıdaki options ile ML Kit ObjectDetector instance'ı oluşturuyoruz.
    _detector = ObjectDetector(options: options);
  }

  // ML Kit'in native taraftaki ObjectDetector instance'ı.
  late final ObjectDetector _detector;

  /// Diskteki görsel dosyasını işleyip tespit edilen nesneleri döner.
  Future<List<DetectedObject>> detectFromFile(File imageFile) async {

    // File path -> ML Kit’in anlayacağı InputImage formatına çeviriyoruz.
    final inputImage = InputImage.fromFilePath(imageFile.path);

    // ML Kit tespit işlemini burada yapar ve sonucu DetectedObject listesi olarak döner.
    final objects = await _detector.processImage(inputImage);

    // Üst katman bu listeyi kullanarak:
    // - boundingBox çizebilir
    // - labels gösterebilir
    // - confidence değerlerine göre filtreleyebilir.
    return objects;
  }

  /// Servis kapanırken native taraftaki detektörü serbest bırakır.
  Future<void> dispose() async {

    // ML Kit detektörünü kapatmak bellek/handle sızıntılarını önler.
    await _detector.close();
  }
}
