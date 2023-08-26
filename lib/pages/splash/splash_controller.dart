import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../utils/log.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log("On init SplashController");

    String initialRoute = AppPages.INITIAL;
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(initialRoute);
    });

    super.onInit();
  }

  @override
  void onClose() {
    log("onClose SplashController");
    // TODO: implement onClose
    super.onClose();
  }
}