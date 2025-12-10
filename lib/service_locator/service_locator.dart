import 'package:get_it/get_it.dart';
import 'package:smart_exploration_notes/service_locator/camera_service.dart';
import 'package:smart_exploration_notes/service_locator/object_detection_service.dart';

final getItInstance = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Servislerinizi burada kaydedin
  getItInstance.registerLazySingleton<CameraProcess>(() => CameraProcess());
  getItInstance.registerLazySingleton<ObjectDetectionService>(() => ObjectDetectionService());
}
