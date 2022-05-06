import 'package:badges/badges.dart';
import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/logic/AuthController/MainScreenController.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainScreen extends GetView<MainScreenController> {
   MainScreen({Key? key}) : super(key: key);
   final Cart_controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Obx((){
          return Scaffold(
            backgroundColor:context.theme.backgroundColor,
            appBar: AppBar(elevation: 0,
              title: Text(controller.title[controller.CurrentIndex.value].tr,
              )
              ,leading: Container(),
              backgroundColor: Get.isDarkMode ? darkGreyClr:mainColor,
              centerTitle: true,actions: [
                Obx(()=>Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      Cart_controller.quantity().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    child:   IconButton(onPressed:(){
                      Get.toNamed(Routes.CartScreen);
                    },
                      icon: Icon(Icons.shopping_cart),
                    )
                )
                )
            ],),

            bottomNavigationBar: BottomNavigationBar(
              // elevation: 0,
              backgroundColor: Get.isDarkMode ? darkGreyClr:Colors.white ,
              currentIndex: controller.CurrentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,color:Get.isDarkMode?Colors.white:Colors.black),label:"",
                    activeIcon: Icon(Icons.home,color:Get.isDarkMode?pinkClr:mainColor,) ),
                BottomNavigationBarItem(icon: Icon(Icons.category,color:Get.isDarkMode?Colors.white:Colors.black),label:"",
                    activeIcon: Icon(Icons.category,color:Get.isDarkMode?pinkClr:mainColor,)  ),
                BottomNavigationBarItem(icon: Icon(Icons.favorite,color:Get.isDarkMode?Colors.white:Colors.black),label:"",
                    activeIcon: Icon(Icons.favorite,color:Get.isDarkMode?pinkClr:mainColor,)  ),
                BottomNavigationBarItem(icon: Icon(Icons.settings,color:Get.isDarkMode?Colors.white:Colors.black),label:"",
                    activeIcon: Icon(Icons.settings,color:Get.isDarkMode?pinkClr:mainColor,)  )
              ],
              onTap:(index){
              controller.CurrentIndex.value=index;
              } ,
            ),
            body:IndexedStack(
              index: controller.CurrentIndex.value,
              children: controller.tabs.value,
            ) ,
          );
        }
        )
    );
  }
}
