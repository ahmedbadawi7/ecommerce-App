import 'package:ecommerce/logic/categoriesController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CategoryWidget/Items_Catgry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key}) : super(key: key);
   final controller = Get.find<CategoriesController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       controller.isLoging.value ?
           CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ): Expanded(
         child: ListView.separated(itemBuilder:(context,index){
           return InkWell(
               onTap: (){
                 controller.getCategorioyIndex(index);
                 Get.to(ItemsCatgory(CategoriesTitle: controller.CategoriesNameList[index],));
               },
               child: Container(
                 height: 140,
                 width: double.infinity,
                 decoration:  BoxDecoration(
                     color: Colors.white,
                     image:DecorationImage(
                         image:  NetworkImage(controller.imageCategory[index]
                         ),fit: BoxFit.cover
                     )
                 ),
                 child:Padding(padding: EdgeInsets.only(left: 20,bottom: 10),
                   child: Align(
                     alignment: Alignment.bottomLeft,
                     child: Text(controller.CategoriesNameList[index],
                       style: TextStyle(backgroundColor: Colors.black38,color: Colors.white,
                           fontWeight: FontWeight.bold,fontSize: 22),),
                   ),
                 ),
               )
           );
         },
             separatorBuilder: (context,index)=>SizedBox(height: 20,),
             itemCount: controller.CategoriesNameList.length),
       )
    );

  }
}
