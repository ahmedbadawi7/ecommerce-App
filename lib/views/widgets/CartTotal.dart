import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartTotal extends GetWidget<CartController> {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding:const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(size: 16, text: 'Total'.tr,color: Colors.grey,fontweight: FontWeight.bold,),
                  Text(
                    '\$${controller.total}',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.5
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20,),
              Expanded(child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: (){
                    Get.toNamed(Routes.PaymentScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Check Out".tr,style:
                      TextStyle(fontSize: 20,color: Colors.white),),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor
                  ),
                ),
              ))

            ],
          ),
        )
    );
  }
}
