import 'package:get/get.dart';
import 'package:practice_getx/controller/CatController.dart';
import 'package:practice_getx/repository/CatRepository.dart';

class CatBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CatRepository(Get.find()));
    Get.lazyPut(() => CatController(Get.find()));
  }
}
