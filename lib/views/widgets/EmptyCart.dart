import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart,size: 150,color: Get.isDarkMode?Colors.white:Colors.black,),
          const SizedBox(height: 40,),
          RichText(text: TextSpan(
            children:[
              TextSpan(text: "Your Cart is ".tr,
                  style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
            TextSpan(text: "Empty ".tr,
            style: TextStyle(color: Get.isDarkMode?pinkClr:mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),),
            ]
          ) ),
          SizedBox(height: 10,),
          CustomText(size: 15, text:'Add items to get Started'.tr,fontweight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,),
         const SizedBox(height: 50,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                primary: Get.isDarkMode ? pinkClr : mainColor
              ),
              onPressed:(){
            Get.toNamed(Routes.MainScreen);
          }, child: CustomText(text: 'Go to Home'.tr,size: 20,color: Colors.white,)
          )],
      ),
    );
  }
}
