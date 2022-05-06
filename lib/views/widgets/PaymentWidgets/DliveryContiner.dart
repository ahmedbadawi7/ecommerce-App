import 'package:ecommerce/logic/AuthController/AuthController.dart';
import 'package:ecommerce/logic/PaymentController.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DliveryContiner extends StatefulWidget {
  const DliveryContiner({Key? key}) : super(key: key);
  @override
  _DliveryContinerState createState() => _DliveryContinerState();
}

class _DliveryContinerState extends State<DliveryContiner> {
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  final TextEditingController PhoneController = TextEditingController();
  int radioContinerIndex = 1;
  bool changeColors = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(address: "شارع الوادي",
        name: 'wadbadawi',
          phone: "998061400",
          title: 'الفكهاني',
          value: 1,
          color:changeColors ? Colors.white:Colors.grey.shade500,
          onChanged: (int? value){
          setState(() {
            radioContinerIndex=value!;
            changeColors=!changeColors;
          });
          }, icon: Container()
        ),
        SizedBox(height: 10,),
        Obx(()=>
            buildRadioContiner(address: controller.addriess.value,
                name: authController.yourName.value,
                phone: controller.phoneNumber.value,
                title: 'Delivery',
                value: 2,
                color:changeColors ? Colors.grey.shade500:Colors.white,
                onChanged: (int? value){
                  setState(() {
                    radioContinerIndex=value!;
                    changeColors=!changeColors;
                  });
                }, icon: InkWell(onTap: (){
                  Get.defaultDialog(title: "Enter your Phone Number",titleStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),backgroundColor: Colors.white,radius: 10,
                      textCancel: " Cancel ",
                      confirmTextColor: Colors.black,
                      textConfirm: " Save",
                      cancelTextColor: Colors.black,
                      onCancel: (){
                        Get.toNamed(Routes.PaymentScreen);
                      },
                      onConfirm: (){
                        Get.back();
                        controller.phoneNumber.value=PhoneController.text;
                      },
                      buttonColor: Get.isDarkMode?pinkClr:mainColor,
                      content: Padding(padding:const EdgeInsets.all(15),
                        child: TextFormField(
                          controller: PhoneController,
                          cursorColor: Colors.black,
                          onFieldSubmitted: (value){
                            PhoneController.text=value;
                          },
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          decoration: InputDecoration(
                              fillColor: Get.isDarkMode ? pinkClr :mainColor.withOpacity(0.1),
                              focusColor: Colors.red,
                              prefixIcon: Icon(Icons.phone,
                                  color:Get.isDarkMode? pinkClr:mainColor),

                              suffixIcon: IconButton(onPressed: (){
                                PhoneController.clear();
                              },
                                icon:  Icon(Icons.close),
                                color: mainColor,
                              ),

                              hintText: "Enter Your Phone Number".tr,
                              hintStyle: TextStyle(color:Get.isDarkMode? Colors.black54: Colors.black54),
                              helperStyle: const TextStyle(color: Colors.black45,fontSize: 12,fontWeight: FontWeight.w500,),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20)
                              )

                          ),
                        ),

                      )

                  );
                },child: Icon(Icons.contact_phone,
                  size:20,color: Get.isDarkMode ? pinkClr : mainColor,))
            ),
        )
      ],
    );
  }

Widget buildRadioContiner({
  required Color color,
  required int value,
  required Function onChanged,
  required String name,
  required String title,
  required String phone,
  required String address,
  required Widget icon,
}) {
  return Container(
    height: 150,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5
          )
        ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Radio(
          value: value,
          groupValue: radioContinerIndex,
          onChanged: (int? value) {
            onChanged(value);
          },
          fillColor:
          MaterialStateColor.resolveWith((states) => Colors.red)
          ,),
        const SizedBox(width: 5,),
        Padding(padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(size: 20,
                text: title,
                color: Colors.black,
                fontweight: FontWeight.bold,),
              const SizedBox(height: 5,),
              CustomText(size: 15, text: name, color: Colors.black,),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Text('🇸🇩 ',style: TextStyle(color: Get.isDarkMode ? Colors.black:Colors.white),),
                  CustomText(size: 15, text: phone, color: Colors.black,),
                  const SizedBox(width: 120,),
                  SizedBox(
                    child: icon,
                  )
                ],
              ),
              const SizedBox(height: 5,),
              CustomText(size: 15, text: address, color: Colors.black,),
            ],
          ),
        )
      ],
    ),
  );
}
}