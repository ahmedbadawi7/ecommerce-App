import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FaveritScreen extends GetView<ProductController> {
  const FaveritScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
    body: Obx((){
      if(controller.faveritList.isEmpty){
      return Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,width: 100,
                child: Image.asset("assets/images/heart.png"),
              ),
              SizedBox(height: 20,),
              CustomText(text: 'Please, Add your favorites products.'.tr,
                size: 18,
                color: Get.isDarkMode?Colors.white:Colors.black,
                fontweight: FontWeight.bold,
              )
            ],

          ),
        );
      }else{
        return ListView.separated(
            itemBuilder: (context,index){
          return buildFaveritItem(image:controller.faveritList[index].image,
              title: controller.faveritList[index].title,
              price: controller.faveritList[index].price,
              productid: controller.faveritList[index].id);
        },
            separatorBuilder: (context,index){
              return const Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.faveritList.length);
      }
    })
     );
  }
  Widget buildFaveritItem({
  required String image,
    required String title,
    required double price,
    required int productid
}){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
            ),
          ),
            const Spacer(),
            IconButton(onPressed:(){
              controller.mangeFavouritmes(productid);
            }, icon: const Icon(Icons.favorite,color: Colors.red,size: 30,))
        ]
          ,)
        ,)
      ,);
  }
}