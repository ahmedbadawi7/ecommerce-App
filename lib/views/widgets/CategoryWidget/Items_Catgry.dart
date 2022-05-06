import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/logic/categoriesController.dart';
import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/screens/product_detalis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CustomText.dart';
class ItemsCatgory extends GetView<ProductController> {
  final String CategoriesTitle;
   ItemsCatgory({required this.CategoriesTitle,Key? key}) : super(key: key);
  final Cartcontroller = Get.find<CartController>();
   final Catcontroller = Get.find<CategoriesController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(CategoriesTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,),
      body: Obx(()=>
      Catcontroller.isLogingCat.value ?
      Center(
        child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        ),
      ):
          GridView.builder(
              itemCount: Catcontroller.CategoriesList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {

                return buildCardItems(
                    image:  Catcontroller.CategoriesList[index].image,
                    price:  Catcontroller.CategoriesList[index].price,
                    rate:  Catcontroller.CategoriesList[index].rating.rate,
                    id:  Catcontroller.CategoriesList[index].id,
                    productModel:  Catcontroller.CategoriesList[index],
                    onTap: () {
                      Get.to(() =>
                          productDetailsScreen(productModel:Catcontroller.CategoriesList[index],)
                      );
                    }
                );
              }

          ),
      )
    );
  }
   Widget buildCardItems({
     required String image,
     required double price,
     required double rate,
     required int id,
     required ProductModel productModel,
     required Function() onTap,

   }){
     return Padding(
       padding: const EdgeInsets.all(8),
       child: InkWell(
         onTap: onTap,
         child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Colors.white,
             boxShadow: [
               BoxShadow(
                   color: Colors.grey.withOpacity(0.2),
                   spreadRadius: 3.0,
                   blurRadius: 5.0
               )
             ],
           ),
           child: Column(
             children: [
               Obx(() => Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   IconButton(onPressed:(){
                     controller.mangeFavouritmes(id);
                   }, icon: controller.isFaverite(id)
                       ?Icon(Icons.favorite,
                     color: Colors.red,
                   ):Icon(Icons.favorite_outline,color: Colors.black,)),

                   IconButton(onPressed:(){
                     Cartcontroller.addProductYorCart(productModel);
                   }, icon: const Icon(Icons.shopping_cart,color: Colors.black,)),
                 ],),
               ),
               Padding(
                 padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
                 child: Container(
                   width: double.infinity,
                   height: 85,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(20)
                   ),
                   child: Image.network(image,fit: BoxFit.fitHeight,),

                 ),
               ),
               Padding(
                 padding:  EdgeInsets.only(left:15,right: 15,top: 10),
                 child: Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CustomText(size: 13, text:"\$ $price",color: Colors.black,fontweight: FontWeight.bold),
                       Container(
                         height: 20,
                         width: 45,
                         decoration: BoxDecoration(
                             color: mainColor,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: Padding(
                           padding: EdgeInsets.only(left: 3,right: 2),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               CustomText(size: 13, text:'$rate',fontweight: FontWeight.bold,color: Colors.white,),
                               const Icon(Icons.star,size: 13,color: Colors.white,)
                             ],
                           ),

                         ),
                       )

                     ],

                   ),
                 ),
               ),

             ],
           ),
         ),
       ),
     );
   }
}

