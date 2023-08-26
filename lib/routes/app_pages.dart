import 'package:get/get.dart';

import '../pages/animation/animation_view.dart';
import '../pages/home/home_view.dart';
import '../pages/pokemons/pokemons_view.dart';
import '../pages/pokemons/repository_binding.dart';
import '../pages/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;
  static const Pokemons = Routes.Pokemons;
  static const SPLASH = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.Animation,
      page: () => AnimationView(),
    ),
    GetPage(
      name: Routes.Pokemons,
      page: () => PokemonView(),
      binding: RepositoryBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
    ),
  ];
}