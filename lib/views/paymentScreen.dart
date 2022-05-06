import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:ecommerce/views/widgets/PaymentWidgets/DliveryContiner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/PaymentWidgets/PaymentMethod.dart';
class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(title: Text("Payment".tr),
      centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr:mainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(size: 24, text: "shipping to",
            color: Get.isDarkMode ? Colors.white:Colors.black,
            ),
            const SizedBox(height: 20,),
            const DliveryContiner(),
            const SizedBox(height: 20,),
            CustomText(size: 24, text: "Payment method",
              color: Get.isDarkMode ? Colors.white:Colors.black,
            ),
            const SizedBox(height: 20,),
            const PaymentMethod(),
            const SizedBox(height: 20,),
            //Total Button
            Center(
              child: CustomText(size: 20, text: "Tota:${cartController.total}\$",fontweight: FontWeight.bold,
              color: Get.isDarkMode?Colors.white:Colors.black,
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: SizedBox(
                height: 50,
                width: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Get.isDarkMode ? pinkClr:mainColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)
                    ),elevation: 0
                  ),
                  onPressed: (){},
                  child: Text("Pay Now",style: TextStyle(fontSize: 22,color: Get.isDarkMode?Colors.white:Colors.black),),
                ),
              ),
            )


          ],
        ),
        ),
      )
    );
  }
}
