import 'package:belajar_local_database/pages/create/controller.dart';
import 'package:get/get.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}
