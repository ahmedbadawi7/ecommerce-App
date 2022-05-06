import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/logic/SettingControoler.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Profile extends StatelessWidget {
   Profile({Key? key}) : super(key: key);
   final controller = Get.find<SettingController>();
   final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Column(
          children: [
            Row(children: [
              Container(height: 100,width: 100,
                decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(authController.DisplayUserPhoto.value),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(size: 19, text: controller.capitalize(authController.yourName.value),color: Get.isDarkMode?Colors.white:Colors.black,
                    fontweight: FontWeight.bold,
                  ),
                  CustomText(size: 12, text:authController.yourEmail.value,color: Get.isDarkMode?Colors.white:Colors.black,
                    fontweight: FontWeight.bold,
                  )
                ],)
            ],)
          ],
        )
    );
  }
}
