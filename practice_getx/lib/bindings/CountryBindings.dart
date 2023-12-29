import 'package:get/get.dart';
import 'package:practice_getx/controller/CountryController.dart';
import 'package:practice_getx/repository/CountryRepository.dart';

class CountryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryRepository(Get.find()));
    Get.lazyPut(() => CountryController(Get.find()));
  }
}

