import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
  openPageAnimation(String text)
  {
    Get.toNamed(Routes.Animation,arguments: [text]);
  }
  openPagePokemons()
  {
    Get.toNamed(Routes.Pokemons);
  }
}