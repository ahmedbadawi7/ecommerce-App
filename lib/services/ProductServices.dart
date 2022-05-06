import 'package:ecommerce/model/ProductModel.dart';
import 'package:ecommerce/utells/my_String.dart';
import 'package:http/http.dart' as http;


class ProductServices {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ProductFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }
}
