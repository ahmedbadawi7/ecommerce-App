import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CheckboxWidget extends GetView<AuthController> {
   CheckboxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return  Row(
        children: [
          InkWell(
              onTap: (){
                controller.CheckBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)
                ),
                child:controller.isCheckBox
                    ? Get.isDarkMode?Image.asset('assets/images/check.png'):const Icon(Icons.done,color: pinkClr,):
                Container(),
              )
          ),
          SizedBox(width: 10,),
          Row(children: [
            CustomText(size: 16, text: 'I accept '.tr,
              color:Get.isDarkMode?Colors.black:Colors.white,fontweight: FontWeight.normal,),
            CustomText(size: 16, text: 'terms & conditions'.tr,
              color:Get.isDarkMode? Colors.black:Colors.white,fontweight: FontWeight.normal,underline:TextDecoration.underline,)
          ],)
        ],
      );
    }

    );
  }
}
