import 'package:ecommerce/logic/AuthController/ThemController.dart';
import 'package:ecommerce/logic/SettingControoler.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DarkMode extends StatelessWidget {
  final darkcontroller = Get.find<SettingController>();
   DarkMode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
                activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
                activeColor: Get.isDarkMode ? pinkClr : mainColor,
                value: darkcontroller.switchValue.value
                , onChanged: (value){
                  ThemeController().changesTheme();
                  darkcontroller.switchValue.value = value;
            })

          ],
        )
    );
  }
  Widget buildIconWidget(){
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings
          ),
          child: Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20,),
        CustomText(size: 22, text: "Dark Mode".tr,
          color: Get.isDarkMode ?Colors.white:Colors.black,),

      ],
    ),



  );
  }
}
