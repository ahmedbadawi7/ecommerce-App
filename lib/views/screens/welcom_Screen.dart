import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/splash.jpg',fit: BoxFit.fitHeight,),
          ),
          Container(
            color: Colors.black.withOpacity(0.2),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Container(
                  height: 60, width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: CustomText(text: 'welcom'.tr,size:35 , fontweight: FontWeight.bold,color: Colors.white,)),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 60, width: 230,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(size: 35,fontweight: FontWeight.bold,text: 'Toha'.tr,color: darkGreyClr,),
                      SizedBox(width: 10,),
                      CustomText(size: 35,fontweight: FontWeight.bold,text: 'Shop'.tr,color: pinkClr,),

                    ],

                  )
                ),
               SizedBox(height: 230,),
               ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   primary: darkGreyClr,
                   shape: RoundedRectangleBorder(
                     borderRadius:BorderRadius.circular(10)
                   ),
                   padding:const EdgeInsets.symmetric(horizontal: 40,vertical: 12)
                 ),
                   onPressed: (){
                     Get.offNamed(Routes.LoginScreen);
                   }, child: const CustomText(size: 22, text: 'Get Start',fontweight: FontWeight.bold,color: Colors.white,)),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(size: 18, text: "If You Don't Account?".tr,fontweight: FontWeight.normal,color: Colors.white,),
                    TextButton(onPressed:(){
                      Get.offNamed(Routes.Regstrision);
                    }, child:CustomText(text: "Sing Up".tr,size: 20,color: Colors.white,fontweight: FontWeight.normal,underline: TextDecoration.underline,))
                  ],
                )
              
              ],
            ),
          )
        ],
      ),
    ));
  }
}
