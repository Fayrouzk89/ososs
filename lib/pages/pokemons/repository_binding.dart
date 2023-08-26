import 'package:get/get.dart';

import 'pokemons_controller.dart';
class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PokemonsController());
  }
}