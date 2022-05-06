import 'package:ecommerce/logic/SettingControoler.dart';
import 'package:ecommerce/utells/my_String.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../CustomText.dart';
class language extends StatelessWidget {
   language({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        builder: (_) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: languageSettings
            ),
            child:  const Icon(
              Icons.language,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
          CustomText(size: 22, text: "Language".tr,
            color: Get.isDarkMode ?Colors.white:Colors.black,),

        ],
      ),
    ),
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              width: 2,
            ),
          ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconSize: 25,
            icon: Icon(Icons.arrow_drop_down,color: Get.isDarkMode ? Colors.white : Colors.black,),
          items: [
                DropdownMenuItem(child: Text(arabic,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize:16),
                  ),value: ara,
                ),
            DropdownMenuItem(child: Text(english,style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:16),
            ),value:ene ,
            ),
            DropdownMenuItem(child: Text(france,style: TextStyle(fontWeight: FontWeight.bold,
                fontSize:16),
            ),value: frf,
            ),
          ],
            value: controller.LangLocal,
            onChanged: (value){
              controller.changelanguage(value!);
              Get.updateLocale(Locale(value));
            },
          ),
        ),
      ),
    ],)
    );
  }
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
