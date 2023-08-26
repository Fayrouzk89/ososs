import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/src/form_data.dart' as formdata;
import 'package:dio/src/response.dart' as resp;
import 'package:task/services/app_strings.dart';
import 'package:task/utils/log.dart';
import 'package:dartz/dartz.dart';
import '../models/failure_res.dart';
import '../services/datasource.dart';
import 'constants.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../services/network_info.dart' as net;

class RestConnector {
  String url;
  String requestType;
  String data;
  formdata.FormData? formData;
  String dataType;
  bool clearCookies;

  RestConnector(
      {required this.url,
      this.requestType: "GET",
      this.data: "",
      this.formData: null,
      this.dataType: "json",
      this.clearCookies: false});

  Future<Either<Failure, resp.Response>> getPokemons() async {
    // TODO: implement getPokemons
    net.NetworkInfoImpl NetworkInfoImpl =
        net.NetworkInfoImpl(InternetConnectionChecker());
    if (await NetworkInfoImpl.isConnected) {
      try {
        try {
          Dio dio = Dio();
          RequestOptions requestOptions = RequestOptions(path: this.url);
          if (dataType == "json") {
            log("******** BEFORE JSON " +
                requestType +
                " REQUEST  ********* url:" +
                url +
                "; values:" +
                data.toString());

            requestOptions.headers = {
              Headers.contentTypeHeader: "application/json"
            };
            String? myToken = GetStorage().read<String>("myToken");
            if (myToken == null) myToken = "";
            log("****** mToken in request:" + myToken);
            requestOptions.headers["X-Csrf-Token"] = myToken;

            resp.Response response = await dio.request(
              url,
              data: data,
              //options: cacheOptions,
            );
            log("******** AFTER JSON request, response:" +
                response.data.toString());
            if (response != null)
              return Right(response);
            else
              return Left(
                  Failure(ApiInternalStatus.FAILURE, ResponseMessage.DEFAULT));
          }
        } on DioError catch (e) {
          log("EXCEPTION DIO ERROR FROM GETDATA:" + e.toString());
          return Left(Failure(ApiInternalStatus.FAILURE, e.toString()));
        } catch (e) {
          var x = e.toString();
          return Left(Failure(ApiInternalStatus.FAILURE, e.toString()));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }

      // there is no internet
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    return Left(Failure(ApiInternalStatus.FAILURE, AppStrings.error));
  }
}
