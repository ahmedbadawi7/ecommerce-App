import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/views/widgets/Product_Details/AddCart.dart';
import 'package:ecommerce/views/widgets/Product_Details/ClothesInfo.dart';
import 'package:ecommerce/views/widgets/Product_Details/ImageSliders.dart';
import 'package:ecommerce/views/widgets/Product_Details/SizeList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class productDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const productDetailsScreen({required this.productModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModel.image,),
              ClothesInfo(title: productModel.title,productId: productModel.id,rate:productModel.rating.rate,descripion: productModel.description,),
              const SizeList(),
              AddCart(productModel: productModel,price:productModel.price),

            ],
          ),
        ),
      ),
    );
  }
}
