import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var productsMap = {}.obs;
  void addProductYorCart(ProductModel productModel){
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] += 1;
    } else {
      productsMap[productModel] = 1;
    }
  }
  
  void removeProductFromCart(ProductModel productModel){
    if(productsMap.containsKey(productModel) && productsMap[productModel]==1){
      productsMap.removeWhere((key, value) => key == productModel);
    }else{
      productsMap[productModel] -= 1;
    }

  }
  void removeJastProduct(ProductModel productModel){
    productsMap.removeWhere((key, value) => key == productModel);
  }

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }

}

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products".tr,
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products'.tr,
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ".tr,
      cancelTextColor: Colors.white,
      textConfirm: " YES ".tr,
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.CartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }
  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);


}