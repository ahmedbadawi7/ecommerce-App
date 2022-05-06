import 'package:ecommerce/views/widgets/CategoryWidget/CategoryWidget.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategryScreen extends StatelessWidget {
  const CategryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:  Padding(padding: const EdgeInsets.only(left: 15,top:15),
      child: Column(
          children: [
            Align(alignment: Alignment.topLeft,
      child:Padding(
         padding: const EdgeInsets.only(left: 15,top:15),
        child: CustomText(text: "Catgrioes".tr,size: 35,
          color: Get.isDarkMode?Colors.white:Colors.black,fontweight: FontWeight.bold,),
      ) ,
      ),SizedBox(height: 20,),
            CategoryWidget()
        ],
      ),
      ),
    );
  }
}