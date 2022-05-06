import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/AuthButton.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:ecommerce/views/widgets/TextFormFeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPassword extends GetView<AuthController> {
   ForgetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Scaffold(
       appBar: AppBar(elevation: 0,backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
       title: CustomText(text:'ForgetPassword'.tr ,size:14 ,color:Get.isDarkMode?Colors.white:pinkClr,),centerTitle: true,
         leading: IconButton(onPressed:(){
           Get.back();
         } ,icon:Icon(Icons.arrow_back,color:Get.isDarkMode?Colors.black:Colors.white,)
           ,),
       ),
       backgroundColor:context.theme.backgroundColor,
       body: Form(
         key:controller.RestformKey,
         child: SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
               children: [
                 Align(
                   alignment: Alignment.centerRight,
                   child: IconButton(onPressed: (){
                     Get.back();
                   },icon:Icon(Icons.close_rounded,color: Colors.white,) ,),
                 ),SizedBox(height: 20,),
             Text(
               'If you want to recover your account, then please provide your email ID below..',
               textAlign: TextAlign.center,
               style: TextStyle(
                 color: Get.isDarkMode ? Colors.black : Colors.white,
               ),
             ),
                 const SizedBox(
                   height: 50,
                 ),
                 Image.asset(
                   'assets/images/forgetpass copy.png',
                   width: 250,
                 ),
                 const SizedBox(
                   height: 50,
                 ),
                 CustomTextFromFiled(editingController: controller.emailController,
                   keyboardType: TextInputType.text,

                   validator: (value){
                   return controller.validateEmail(value!);
                   }
                   ,prefixIcon: Get.isDarkMode ? Image.asset(
                       'assets/images/lock.png') :
                   Icon(Icons.email, color: Colors.pink, size: 30,),textFieldHint: "Email",),
                 const SizedBox(height: 60,),
                 AuthButtom(onPressed:(){
                   if (controller.RestformKey.currentState!.validate()){
                     String email = controller.emailController.text.trim();
                     controller.ResetPasswordFireBase(email);
                   }
                 } ,title: 'send',)



               ],
             ),
           ),
         ),
       ),
     ),
    );
  }
}
