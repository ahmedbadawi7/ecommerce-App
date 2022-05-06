import 'package:ecommerce/logic/ProductController.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:ecommerce/views/widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String descripion;
   ClothesInfo({required this.title,required this.productId,required this.rate,required this.descripion,Key? key}) : super(key: key);
    final Controller=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25 , vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Get.isDarkMode?Colors.white:Colors.black,overflow: TextOverflow.ellipsis),)),
              Obx(()=>
              Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.white.withOpacity(0.9) :Colors.grey.withOpacity(0.4),
              shape: BoxShape.circle
              ),
              child: InkWell(
              onTap: (){
                Controller.mangeFavouritmes(productId);
              },
              child:Controller.isFaverite(productId) ?Icon(Icons.favorite,
                color: Colors.red,size: 20,)
              :Icon(Icons.favorite_outline,
    color: Colors.black,size: 20,),
              )
              )
              )
            ],
          ),
          Row(children: [
            CustomText(size: 14, text: "$rate",fontweight: FontWeight.bold,color: Get.isDarkMode? Colors.white : Colors.black,),
            SizedBox(width: 8,),
          RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            itemSize: 20,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),



          ],),
          SizedBox(height: 20,),
          ReadMoreText(descripion,style: TextStyle(color:Get.isDarkMode?Colors.white:Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,height: 1.5),
          trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            trimMode: TrimMode.Line,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode? pinkClr: mainColor
            ),
            moreStyle: TextStyle(
                fontSize:  16, height: 2,
                color: Get.isDarkMode? pinkClr: mainColor
            ),
          )
        ],
      ),
    );
  }
}
