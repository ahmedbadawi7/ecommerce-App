import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddCart extends StatelessWidget {
  final double price;
  final ProductModel productModel;
   AddCart({required this.productModel,required this.price,Key? key}) : super(key: key);
  final ControllerCart = Get.find<CartController>();
   @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
               CustomText(size: 16, text: 'Price'.tr,color: Colors.grey,fontweight: FontWeight.bold,),
              Text(
                '\$ $price',
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black54,
                  fontWeight: FontWeight.bold,
                  height: 1.8,
                ),
              )
            ],
          ),
          SizedBox(width: 20,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed:(){
                ControllerCart.addProductYorCart(productModel);
              },style:ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),elevation: 0,
                primary:Get.isDarkMode?pinkClr:mainColor,
              ) , child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text("Add To Cart".tr,style:TextStyle(
                      color: Colors.white
                  ),
                  ),
                  SizedBox(width: 10,child: Icon(Icons.shopping_cart_outlined),)
                ],
              ) ),
            ),
          )
        ],
      ),

    );
  }
}
