import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/screens/product_detalis.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartItems extends GetView<ProductController> {
   CartItems({Key? key}) : super(key: key);
  final Cartcontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoding.value){
        return Center(child: CircularProgressIndicator
          (color: Get.isDarkMode?pinkClr: mainColor,));
      }else{
        return Expanded(
          child: Padding(
            padding:  EdgeInsets.only(left: 10,right: 10),
            child: controller.searchList.isEmpty && controller.saerchTextController.text.isNotEmpty?
                Get.isDarkMode?Image.asset("assets/images/search_empty_dark.png"):Image.asset("assets/images/search_empry_light.png")
            :GridView.builder(
                itemCount:controller.searchList.isEmpty?controller.productList.length
                    :controller.searchList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 6.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index){
                  if(controller.searchList.isEmpty){
                    return buildCardItems(
                        image:controller.productList[index].image,
                        price: controller.productList[index].price,
                        rate: controller.productList[index].rating.rate,
                        id: controller.productList[index].id,
                        productModel:controller.productList[index],
                        onTap: (){
                          Get.to(()=> productDetailsScreen(productModel: controller.productList[index],));
                        }
                    );
                  }else{
                    return buildCardItems(
                        image:controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate: controller.searchList[index].rating.rate,
                        id: controller.searchList[index].id,
                        productModel:controller.searchList[index],
                        onTap: (){
                          Get.to(()=> productDetailsScreen(productModel: controller.searchList[index],));
                        }
                    );

                  }

                }
            ),
          ),
        );
      }

    });
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
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Image.network(image,fit: BoxFit.fitHeight,),

              ),
            ),
              Padding(
                padding:  EdgeInsets.only(left:15,right: 15,top: 15),
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
