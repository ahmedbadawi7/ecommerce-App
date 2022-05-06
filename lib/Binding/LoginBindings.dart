import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:get/get.dart';


class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(),fenix: true);

  }

}