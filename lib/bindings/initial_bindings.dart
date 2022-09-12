import 'package:get/get.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/controllers/themes/theme_controller.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
  }
}
