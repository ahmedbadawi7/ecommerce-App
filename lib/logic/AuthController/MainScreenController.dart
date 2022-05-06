import 'package:ecommerce/views/screens/SettingScreen.dart';
import 'package:ecommerce/views/screens/categry_Screen.dart';
import 'package:ecommerce/views/screens/favorit_Screen.dart';
import 'package:ecommerce/views/screens/home_Screen.dart';
import 'package:get/get.dart';

class MainScreenController extends GetxController{
  RxInt CurrentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategryScreen(),
    FaveritScreen(),
    SettingScreen(),
  ].obs;
  final title = [
    'Toha Shop'.tr,
    'Catgrioes'.tr,
    'Faverit'.tr,
    'Setting'.tr
  ].obs;

}