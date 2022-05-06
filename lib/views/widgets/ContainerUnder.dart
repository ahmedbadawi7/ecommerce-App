import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ContainerUnder extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String textType;
  const ContainerUnder({Key? key, required this.text,required this.onPressed, required this.textType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      decoration: BoxDecoration(
        color: Get.isDarkMode? mainColor:pinkClr,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30),


        )
      ),child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CustomText(size: 17, text: text ,color: Colors.white,),
      TextButton(onPressed: onPressed,
          child: CustomText(size: 20, text:text ,color: Colors.white,fontweight: FontWeight.bold,),
      ),
      CustomText(size: 18, text:textType ,color: Colors.white,fontweight: FontWeight.bold,underline: TextDecoration.underline,)
    ],
    ),
    );
  }
}
