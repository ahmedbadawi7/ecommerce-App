import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget  {
  final ProductModel productModel;
 final  int index;
 final int quantity;
  CartProduct({
    required this.productModel,
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
      return  Obx(()=>
          Container(
        margin: EdgeInsets.only(left: 20 , right: 20,top: 20),
        height: 130,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Get.isDarkMode ?
            pinkClr.withOpacity(0.7):mainColor.withOpacity(0.4)
        ),
        child: Row(
          children: [
            Container(height: 120,width: 100,margin: const EdgeInsets.only(left: 15),decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(productModel.image),
                    fit: BoxFit.cover
                )
            )
              ,),
            const SizedBox(width: 20,),
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   SizedBox(height: 20,),
                  Text(
                    "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      controller.removeProductFromCart(productModel);
                    },icon: Icon(Icons.remove_circle),color:Get.isDarkMode?Colors.white:Colors.black,),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      controller.addProductYorCart(productModel);
                    },icon: Icon(Icons.add_circle),color:Get.isDarkMode?Colors.white:Colors.black,)
                  ],),
                IconButton(onPressed: (){
                  controller.removeJastProduct(productModel);
                },icon:Icon(Icons.delete,color:Get.isDarkMode?Colors.black:Colors.red ,size: 20,),)
              ],
            ),
          ],
        ),
      ));
  }
}
