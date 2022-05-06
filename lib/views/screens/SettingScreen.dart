import 'dart:ui';

import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/logic/AuthController/ThemController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:ecommerce/views/widgets/SettingWidget/DarkMode.dart';
import 'package:ecommerce/views/widgets/SettingWidget/LogOut.dart';
import 'package:ecommerce/views/widgets/SettingWidget/Profile.dart';
import 'package:ecommerce/views/widgets/SettingWidget/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingScreen extends GetView<AuthController> {

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(padding:const EdgeInsets.all(24),
      children: [
       Profile(),
       const SizedBox(height: 20,),
        Divider(color: Get.isDarkMode ? Colors.white:Colors.grey,
        thickness: 2,
        ),
       const SizedBox(height: 20,),
        CustomText(size: 18, text: "GENERAL".tr,color: Get.isDarkMode ? pinkClr:mainColor,),
        const SizedBox(height: 20,),
        DarkMode(),
        const SizedBox(height: 20,),
         language(),
        const SizedBox(height: 20,),
        LogOut(),

      ],
      )
    );
  }
}


// SizedBox(height: 20,),
// TextButton(child:CustomText(text: 'Log Out',
// size: 13,color: Get.isDarkMode?Colors.white:Colors.black,) ,
// onPressed:(){
// Get.defaultDialog(title: "Logout FromApp",
// titleStyle: TextStyle(fontSize: 18,color: Colors.black
// ,fontWeight: FontWeight.bold),
// middleText: 'Are you sure neet to logout',
// middleTextStyle:TextStyle(fontSize: 18,color: Colors.black,
// fontWeight: FontWeight.bold),
// backgroundColor: Colors.grey.shade400,
// radius: 10,textCancel: " No ",
// cancelTextColor:Colors.white,
// textConfirm: " yes ",
// confirmTextColor: Colors.white,
// onCancel: (){
// Get.back();
// },
// onConfirm: (){
// controller.signOutFormApp();
// },buttonColor: Get.isDarkMode? pinkClr:mainColor);
// } ,)
//
// ],
// ),