import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/services/ProductServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  var isLoding = true.obs;
  var productList = <ProductModel>[].obs;
  var faveritList = <ProductModel>[].obs;
  var Stoarge = GetStorage();

  //search
  var searchList = <ProductModel>[].obs;
  TextEditingController saerchTextController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedShoppings = Stoarge.read<List>('faverit');
    if (storedShoppings != null) {
      faveritList = storedShoppings.map((e) =>
          ProductModel.fromJson(e)).toList().obs;
    }
    getproduct();
  }

  void getproduct() async{
    var products = await ProductServices.getProduct();
    try{
      isLoding(true);
      if(products.isNotEmpty){
        productList.addAll(products);
      }
    }finally{
      isLoding(false);
    }
  }
  // logic for faverit Screen
void mangeFavouritmes(int productid) async {
    var extingIndex = faveritList.indexWhere((element) =>
    element.id == productid);
    if(extingIndex >= 0){
      faveritList.removeAt(extingIndex);
      await Stoarge.remove('faverit');
    }else{
    faveritList.add(productList.firstWhere((element) => element.id == productid));
  await  Stoarge.write('faverit', faveritList);
    }
  }
bool isFaverite(int productid){
    return faveritList.any((element) => element.id == productid);
}

// search bar

      void searchToList(String SearchName) {
    searchList.value = productList.where((search){
      return search.title.contains(SearchName.toLowerCase()) ||
          search.price.toString().contains(SearchName.toLowerCase());
    }).toList();
    update();
  }

  void clearSearch(){
    saerchTextController.clear();
    searchToList("");
    update();
  }
}


