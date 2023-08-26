import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/models/api_result.dart';
import 'package:task/utils/constants.dart';
import '../../models/failure_res.dart';
import '../../services/pokemon_api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart' as resp;

class PokemonsController extends GetxController
    with StateMixin<List<Results>>, ScrollMixin {
  PokemonsController();

  List<Results> repositories = [];
  final int repositoriesPerPage = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;
  String nextUrl = "";
  bool isFirst = true;

  @override
  void onInit() {
    nextUrl = "";
    isFirst = true;
    lastPage = false;
    page = 1;
    findAllGitRepositories();
    super.onInit();
  }

  Future<void> findAllGitRepositories() async {
    String url = base_url + "pokemon";
    if (nextUrl != null && nextUrl != "") {
      url = nextUrl;
    }
    if (isFirst || nextUrl != "") {
      Either<Failure, resp.Response>? response = await PokemonAPI().fetch(url);
      if (response != null && response!.isLeft()) {
        Failure left = (response as Left).value;
        change(repositories, status: RxStatus.error(left.message));
      } else if (response != null) {
        resp.Response res = (response as Right).value;
        ApiResult? result = ApiResult.fromJson(res.data);
        final bool emptyRepositories = result!.count == 0 ?? true;
        if (!getFirstData && emptyRepositories) {
          change(null, status: RxStatus.empty());
        } else if (getFirstData && emptyRepositories) {
          lastPage = true;
          nextUrl="";
        } else {
          getFirstData = true;
          repositories.addAll(result.results!);
          nextUrl = result.next!;
          isFirst = false;
          change(repositories, status: RxStatus.success());
        }
      } else {
        change(repositories, status: RxStatus.error("Error Getting data"));
      }
    } else {
      lastPage = true;
    }
  }

  @override
  Future<void> onEndScroll() async {
    print('onEndScroll');
    if (!lastPage) {
      page += 1;
      Get.dialog(Center(child: CircularProgressIndicator()));
      await findAllGitRepositories();
      Get.back();
    } else {
      Get.snackbar('Alert', 'End of Repositories');
    }
  }

  @override
  Future<void> onTopScroll() async {
    print('onTopScroll');
  }
}
