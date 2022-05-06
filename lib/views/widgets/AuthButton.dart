import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AuthButtom extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;

  const AuthButtom({Key? key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary:Get.isDarkMode? mainColor:pinkClr,
        minimumSize: const Size(420, 50),
      ),
      child: CustomText(size: 18,text: title!,
        color: Colors.white,fontweight: FontWeight.bold,),
    );
  }
}
