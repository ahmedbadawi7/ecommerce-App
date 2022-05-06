import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/logic/SettingControoler.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(),fenix: true);


  }

}