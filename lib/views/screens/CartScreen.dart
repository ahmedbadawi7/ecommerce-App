import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CartProduct.dart';
import 'package:ecommerce/views/widgets/CartTotal.dart';
import 'package:ecommerce/views/widgets/EmptyCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends GetWidget<CartController> {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(title: Text('CartScreen'.tr),
            centerTitle: true,elevation: 0,
            backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,actions: [
              IconButton(onPressed:(){controller.clearAllProducts();},
                  icon: Icon(Icons.backpack))
            ],),
          //EmptyCart()
          body: Obx((){
            if(controller.productsMap.isEmpty){
              return EmptyCart();
            }else{
              return SingleChildScrollView(
                  child: Column(
                      children: [
                        SizedBox(
                          height: 670,
                          child: ListView.separated(itemBuilder: (context,index){
                            return CartProduct(productModel: controller.productsMap.keys.toList()[index],index: index,quantity:controller.productsMap.values.toList()[index]);
                          }, separatorBuilder: (context,index) => const SizedBox(height: 20,), itemCount: controller.productsMap.length),
                        ),

                        Padding(padding: EdgeInsets.only(bottom: 30),
                          child: CartTotal(),)

                      ]
                  )
              );
            }
          }
          ),
        )
    );
  }
}
