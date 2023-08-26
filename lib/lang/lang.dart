import 'package:get/get.dart';

import 'en.dart';


class Lang extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': english(),
  };
}