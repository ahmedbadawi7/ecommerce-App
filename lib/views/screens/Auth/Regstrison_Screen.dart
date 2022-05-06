import 'dart:math';

import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/AuthButton.dart';
import 'package:ecommerce/views/widgets/ContainerUnder.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:ecommerce/views/widgets/TextFormFeild.dart';
import 'package:ecommerce/views/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegsterionScreen extends GetView<AuthController> {
   RegsterionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar( backgroundColor:Get.isDarkMode ? Colors.white:darkGreyClr,elevation: 0,),
      backgroundColor: Get.isDarkMode ? Colors.white:darkGreyClr,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             width: double.infinity,
              height: MediaQuery.of(context).size.height /1.3,
              child: Padding(
                padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                child: Form(
                  key: controller.Regstrion_formkey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Row(children:  [
                        CustomText(size: 28, text: "SIGN".tr,
                          fontweight: FontWeight.w500,
                          color: Get.isDarkMode ? mainColor : pinkClr),
                        SizedBox(width: 3,),
                        CustomText(size: 28, text: "UP".tr,
                          fontweight: FontWeight.w500,color:Get.isDarkMode ? Colors.black : Colors.white,)

                      ]
                        ,),
                      SizedBox(height: 30,),
              CustomTextFromFiled(editingController: controller.nameController,
                  keyboardType: TextInputType.text,
                validator: (value){},
                onSaved: (value){
                controller.name=value!;
                },
                  prefixIcon: Get.isDarkMode ?Image.asset('assets/images/user.png')
                      :Icon(Icons.person,color: Colors.pink,size: 30,),
                textFieldHint: "User Name".tr,),
                      SizedBox(height: 15,),
                      CustomTextFromFiled(editingController: controller.emailController,
                        keyboardType: TextInputType.text,
                        onSaved: (vale){
                        controller.email=vale!;
                        },
                        validator: (value){
                       return controller.validateEmail(value!);
                        },prefixIcon:Get.isDarkMode?Image.asset('assets/images/email.png')
                            :Icon(Icons.mail,color: Colors.pink,size: 30,),textFieldHint: "Email".tr,),
                      SizedBox(height: 15,),
                      GetBuilder<AuthController>(
                        builder: (_) {
                          return
                            CustomTextFromFiled(
                            editingController: controller.passwordController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              return controller.validatePassword(value!);
                            },
                              onSaved: (value){
                              controller.password=value!;
                              },
                            prefixIcon: Get.isDarkMode ? Image.asset(
                                'assets/images/lock.png') :
                             Icon(Icons.lock, color: Colors.pink, size: 30,),
                            textFieldHint: "Password".tr,
                            obscure: controller.isVisibilty ? false:true,
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibilty ? Icon(
                                Icons.visibility, color: Colors.black,) :  Icon(
                                  Icons.visibility_off),),);
                        }
                        ),
                      SizedBox(height: 20,),
                      CheckboxWidget(),
                      SizedBox(height: 30,),
                      GetBuilder<AuthController>(
                        builder: (_){
                        return AuthButtom(title: 'SING UP'.tr, onPressed:(){
                          if(controller.isCheckBox == false){
                            Get.snackbar("Error".tr, "please Accept terms & conditions".tr,snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green,colorText:Colors.white);

                          }else if (controller.Regstrion_formkey.currentState!.validate()){
                            String name = controller.nameController.text.trim();
                            String email = controller.emailController.text.trim();
                          String password = controller.emailController.text;
                            controller.SingUpUsingFireBase(
                                name: name,
                                Email: email,
                                Password: password);
                            controller.isCheckBox = true;
                          }

                        }
                        );
                        }
                      ),
                      SizedBox(height: 80,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                            },
                            child: Image.asset(
                              "assets/images/facebook.png",
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: Image.asset(
                              "assets/images/google.png",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            ContainerUnder(text: 'Alrerdy have an Accound?'.tr, onPressed: () {  Get.back(); }, textType: 'Log in'.tr,)
          ],
        ),
      ),
    )
    );
  }
}
