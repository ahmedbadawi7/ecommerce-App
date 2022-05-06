import 'package:ecommerce/logic/AuthController/MainScreenController.dart';
import 'package:ecommerce/logic/PaymentController.dart';
import 'package:ecommerce/logic/SettingControoler.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MainScreenController());
   Get.lazyPut(() => SettingController(),fenix: true);
   Get.put(PaymentController(),permanent: true);
  }
}