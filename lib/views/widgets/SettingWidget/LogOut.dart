import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LogOut extends GetView<AuthController> {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildlogout();
  }
  Widget buildlogout(){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
                Get.defaultDialog(title: "Logout FromApp".tr,
      titleStyle: TextStyle(fontSize: 18,color: Colors.black
      ,fontWeight: FontWeight.bold),
      middleText: 'Are you sure neet to logout'.tr,
      middleTextStyle:TextStyle(fontSize: 18,color: Colors.black,
      fontWeight: FontWeight.bold),
      backgroundColor: Colors.grey.shade400,
      radius: 10,textCancel: " No ".tr,
      cancelTextColor:Colors.white,
      textConfirm: " YES ".tr,
      confirmTextColor: Colors.white,
      onCancel: (){
      Get.back();
      },
      onConfirm: (){
      controller.signOutFormApp();
      },buttonColor: Get.isDarkMode? pinkClr:mainColor);

        },
        splashColor:Get.isDarkMode?pinkClr: mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings
              ),
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20,),
            CustomText(size: 22, text: "Logout".tr,
              color: Get.isDarkMode ?Colors.white:Colors.black,),

          ],
        ),
      ),



    );
  }
}
