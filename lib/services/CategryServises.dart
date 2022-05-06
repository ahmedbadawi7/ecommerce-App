import 'package:ecommerce/model/CategoriesModel.dart';
import 'package:ecommerce/model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/utells/my_String.dart';

class CategoriesServices {
  static Future<List<String>> getCatgry() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoriesModeFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
class AllCategoriesServices {
  static Future<List<ProductModel>> getAllCategories(String categoryNames) async {
    https://fakestoreapi.com/products/category/electronics
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}

