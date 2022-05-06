import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/AuthController/CartController.dart';
import 'package:ecommerce/routes/AppRoutes.dart';
import 'package:ecommerce/utells/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Color_Picker.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({required this.imageUrl  ,Key? key}) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final Cart_controller = Get.find<CartController>();
  CarouselController carouselController = CarouselController();
  final List<Color> Colorselect = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
   int currentPage =0;
   int currentColor =0 ;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(itemCount: 3,
            carouselController: carouselController,
          options: CarouselOptions(height: 500,autoPlay: true,enlargeCenterPage:true,enableInfiniteScroll: false,autoPlayInterval: const Duration(seconds: 2),viewportFraction: 1,onPageChanged: (index,reson){
            setState(() {
              currentPage =index;
            });
          } ),
          itemBuilder: (context , index,realIndex){
          return Container(margin: const EdgeInsets.all(10),decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(widget.imageUrl)
              ,fit: BoxFit.fill,),borderRadius: BorderRadius.circular(25),
          ),);
    },
            ),
        Positioned(bottom: 30,left: 180, child:AnimatedSmoothIndicator(activeIndex:currentPage,count:3,effect: ExpandingDotsEffect(
          dotHeight: 10,dotWidth: 10,activeDotColor: Get.isDarkMode?pinkClr:mainColor,
          dotColor: Colors.black
        ),) ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
          height: 200,
          width: 50,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(30),
          ),
            child: ListView.separated(itemBuilder:(context,index)=>
                GestureDetector(
                  onTap: (){
                    setState(() {
                      currentColor = index;
                    });
                  },
                    child: ColorPicker(color: Colorselect[index],
                      outerBorder: currentColor == index,)),
                separatorBuilder:(index , context)=>SizedBox(),
                itemCount: Colorselect.length),
        )
          ,),
        Container(
          padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.arrow_back_ios,
                  color:Get.isDarkMode ? Colors.black: Colors.white,),

              ),
            ),
          ),
   Obx(()=>
    Badge(
    position: BadgePosition.topEnd(top: -10, end: -10),
    animationDuration: Duration(milliseconds: 300),
    animationType: BadgeAnimationType.slide,
    badgeContent: Text(
    Cart_controller.quantity().toString(),
    style: TextStyle(color: Colors.white),
    ),
    child: InkWell(
    onTap: (){
    Get.toNamed(Routes.CartScreen);
    },
    child: Container(padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
    color: Get.isDarkMode ? pinkClr.withOpacity(0.8) : mainColor.withOpacity(0.8),
    shape: BoxShape.circle,
    ),
    child: Icon(Icons.shopping_cart,
    color:Get.isDarkMode ? Colors.black: Colors.white,),

    ),
    ),
    ),
    )
        ],),
        )
        
      ],
    );
  }
}
