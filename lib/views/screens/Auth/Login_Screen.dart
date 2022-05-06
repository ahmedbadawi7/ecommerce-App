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
class LoginScreen extends GetView<AuthController> {
   LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor: Get.isDarkMode?darkGreyClr :Colors.white ,elevation: 0,),
      backgroundColor:context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: controller.Login_formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height /1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25,right: 25,top: 40),
                    child: Column(
                      children: [
                        Row(children:  [
                          CustomText(size: 28, text: "Log".tr,fontweight: FontWeight.w500,
                            color: Get.isDarkMode ? mainColor : pinkClr,),
                          SizedBox(width: 3,),
                          CustomText(size: 28, text: "IN".tr,fontweight: FontWeight.w500,
                            color:Get.isDarkMode ? Colors.white : Colors.black,)
                        ]
                          ,),
                        SizedBox(height: 50,),
                        CustomTextFromFiled(editingController: controller.emailController,
                          keyboardType: TextInputType.emailAddress,

                          validator: (value){
                         return controller.validateEmail(value!);
                          },
                            onSaved: (value){
                          controller.email=value!;
                            }
                          ,prefixIcon: Get.isDarkMode ? Image.asset(
                              'assets/images/lock.png') :
                          Icon(Icons.email, color: Colors.pink, size: 30,),textFieldHint: "Email",),
                        SizedBox(height: 20,),
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
                                      Icons.visibility, color: Get.isDarkMode?Colors.black:Colors.black,) :  Icon(
                                        Icons.visibility_off,color: Get.isDarkMode?Colors.black:Colors.black,)
                                    ,),);
                            }
                        ),
                        SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.ForgetPasswordScreen);
                            },
                            child: CustomText(
                              text: 'Forgot Password?'.tr,
                              size: 14,
                              color: Get.isDarkMode ? Colors.white : Colors.black,


                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        GetBuilder<AuthController>(
                            builder: (_){
                              return AuthButtom(title: 'SING IN'.tr, onPressed:(){
                                if (controller.Login_formkey.currentState!.validate()){
                                  String email = controller.emailController.text.trim();
                                  String password = controller.emailController.text;
                                  controller.SingInUsingFireBase(email: email,
                                      password: password);
                                }

                              }
                              );
                            }
                        ),

                        SizedBox(height: 30,),
                        CustomText(size: 18, text: 'OR'.tr,
                          color: Get.isDarkMode? Colors.white : Colors.black,fontweight: FontWeight.w500,),

                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.FaceBookUsingFireBase();
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
                              controller.GoogleUsingFireBase();
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

              ContainerUnder(text: "If You Don't Account?".tr, onPressed: () { Get.toNamed(Routes.Regstrision); }, textType: 'Sing Up'.tr,)
            ],
          ),
        ),
      ),
    )
    );
  }
}