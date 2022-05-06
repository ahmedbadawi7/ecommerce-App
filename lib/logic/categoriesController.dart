import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/services/CategryServises.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{


  var CategoriesNameList = <String>[].obs;
  var isLoging = false.obs;
  var isLogingCat = false.obs;
 var CategoriesList =<ProductModel>[].obs;

  List<String> imageCategory = [
    "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1506630448388-4e683c67ddb0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGpld2Vscnl8ZW58MHx8MHx8&auto=format&fit=crop&w=700&q=60",
    "https://media.istockphoto.com/photos/flat-lay-of-modern-mens-clothing-on-a-wooden-background-picture-id665032164?b=1&k=20&m=665032164&s=170667a&w=0&h=17_O0sKPUpoIWLBcIzuVUCe9RnoorOZvuUFMjHJcI1Q=",
    "https://media.istockphoto.com/photos/high-class-female-clothing-picture-id155596905?b=1&k=20&m=155596905&s=170667a&w=0&h=eU9zjfsc1zOJjsULLN7M0sBIDyNW1s773lfappyKv3w=",
  ].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    GetCategorieys();

  }

  void GetCategorieys()async{
    var CategoriesName = await CategoriesServices.getCatgry();
    try{
      isLoging(true);
    if(CategoriesName.isNotEmpty){
      CategoriesNameList.addAll(CategoriesName);
    }
  }finally{
      isLoging(false);
    }
    }

   GetAllCategorieys(String categoryNames)async{
    isLogingCat(true);
    CategoriesList.value=await AllCategoriesServices.getAllCategories(categoryNames);

      isLogingCat(false);

  }
  getCategorioyIndex(int index)async{
    var CategorioryNAme =await GetAllCategorieys(CategoriesNameList[index]);
    if(CategorioryNAme.isNotEmpty){
      CategoriesList.value = CategorioryNAme;
    }

  }


}