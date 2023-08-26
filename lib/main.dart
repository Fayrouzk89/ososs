import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task/utils/themes.dart';

import 'lang/lang.dart';
import 'routes/app_pages.dart';
import 'utils/globals.dart';
import 'utils/log.dart';

void main() async {
  await GetStorage.init();
  String initialRoute = AppPages.SPLASH;

  final Locale? deviceLocale = Get.deviceLocale;
  log("---- device languageCode:" + deviceLocale!.languageCode);
  log("---- device countryCode:" + deviceLocale.countryCode!);

  themeDark = GetStorage().read<bool>('themeDark') ?? false;
  log("---- device themeDark:" + themeDark.toString());

  if (themeDark) {
    Get.changeTheme(Themes.dark);
  } else {
    Get.changeTheme(Themes.light);
  }
  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: "task",
      initialRoute: initialRoute,
      translations: Lang(),
      locale: deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
    ),
  );
}
