import 'package:dio/dio.dart';

import 'dart:convert' as convert;

import '../models/api_result.dart';
import '../models/failure_res.dart';
import '../utils/constants.dart';
import '../utils/log.dart';
import '../utils/rest_connector.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart' as resp;
class PokemonAPI {
  Future<Either<Failure, resp.Response>?> fetch(String url) async {
     log(url);
    try {
      return await RestConnector(url: url).getPokemons();
    } catch (e) {
      log(e);
      return null;
    }
  }
}