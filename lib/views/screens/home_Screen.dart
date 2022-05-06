import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CartItems.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:ecommerce/views/widgets/SearchFromText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
class HomeScreen extends GetView<ProductController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor:context.theme.backgroundColor,
          body: Column(
            children: [
              Container(height:240,width: double.infinity,
                decoration: BoxDecoration(color: Get.isDarkMode?darkGreyClr:mainColor,
                    borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(size: 25, text:'Find Your'.tr ,fontweight: FontWeight.bold,color: Colors.white,),
                    SizedBox(height: 5),
                    CustomText(size: 30, text:'INSPIRATION'.tr ,fontweight: FontWeight.bold,color: Colors.white,),
                    SizedBox(height: 25,),
                    SearchFromText()
                  ],
                ),
              ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomText(size: 20,
                    text: "Catgrioes".tr,fontweight: FontWeight.w500,
                    color: Get.isDarkMode?Colors.white:Colors.black,),
                ),
              ),
              SizedBox(height: 8,),
              CartItems(),


            ],
          ),
        ));
  }
}
