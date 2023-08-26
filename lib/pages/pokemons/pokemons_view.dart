
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/pages/pokemons/pockemonCard.dart';
import 'package:task/utils/constants.dart';
import '../../models/api_result.dart';
import '../../utils/widgets.dart';
import 'pokemons_controller.dart';

class PokemonView extends GetView<PokemonsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('pockemons'.tr)),
        body: Container(
          child: controller.obx(
                (state) => ListView.builder(
              controller: controller.scroll,
              itemCount: state?.length,
              itemBuilder: (context, index) {
                final Results repository = state![index];
                return pockemonCard(results: repository,);
              },
            ),
            onLoading: Center(child: CircularProgressIndicator()),
            onEmpty: Center(
              child: text(
                'Pokemons no found',
                 isCentered: true,textColor: Colors.black
              ),
            ),
            onError: (error) => Center(
              child: text(
                'Error: Cannot get Pokemons \n$error',
                 textColor: Colors.red,isCentered: true
              ),
            ),
          ),
        ));
  }
}