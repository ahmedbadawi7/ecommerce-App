import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SearchFromText extends StatelessWidget{
   SearchFromText({Key? key}) : super(key: key);
 final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder:(_)=>
        TextFormField(
          controller: controller.saerchTextController,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          onChanged: (SearchName){
            controller.searchToList(SearchName);
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              focusColor: Colors.red,
              prefixIcon: Icon(Icons.search,color: Colors.grey,),

              suffixIcon:controller.saerchTextController.text.isNotEmpty?IconButton(onPressed: (){
                controller.clearSearch();
              },icon:const Icon(Icons.close,color: Colors.black,))
                  :null,

              hintText: "Search with name and price".tr,
              hintStyle: TextStyle(color:Get.isDarkMode? Colors.black54: Colors.black54),
              helperStyle: TextStyle(color: Colors.black45,fontSize: 16,fontWeight: FontWeight.w500,),
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
        )
    );
  }
}
