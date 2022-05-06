import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/logic/categoriesController.dart';
import 'package:get/get.dart';

class productBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(()=> CategoriesController());

  }

}