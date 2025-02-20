import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/orderchekout_controller.dart';
import '../model/all_product_model.dart';
import '../utils/constants.dart';


class ApiService {
  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${Constants.baseUrl}$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


  Future<ProductData?> fetchProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token == null) {
        throw Exception('Authorization token not found');
      }

      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print('Decoded Token: $decodedToken');

      String? cafeId = decodedToken['cafe_id']?.toString();
      if (cafeId == null) {
        throw Exception('Cafe ID not found in token');
      }

      print('Cafe ID: $cafeId');

      final url = '${Constants.baseUrl}/GetAllDealsProducts/$cafeId';
      print('API URL: $url');

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
print(response.body);
        // Parse dealProducts and restProducts
        List<AllProductModule> dealProducts = (data['dealProducts'] ?? [])
            .map<AllProductModule>((json) => AllProductModule.fromJson(json))
            .toList();

        List<AllProductModule> restProducts = (data['restProducts'] ?? [])
            .map<AllProductModule>((json) => AllProductModule.fromJson(json))
            .toList();

        // Combine into allProducts (optional: handle sorting or categorization here)
        List<AllProductModule> allProducts = [...dealProducts, ...restProducts];

        // Set the products for order checkout
        final OrderCheckoutController orderCheckoutController = Get.find();
        orderCheckoutController.dealProducts.value = dealProducts;
        orderCheckoutController.restProducts.value = restProducts;
        orderCheckoutController.isLoading.value = false;

        // Debugging: Print out the results
        // print('All Products: $allProducts');
        // for (var product in allProducts) {
        //   print(product.toJson()); // Print individual product details
        // }
        print("Dealllll${dealProducts.toList()}");

        // Debugging: Print separate dealProducts and restProducts
        // print('Deal Products: $dealProducts');
        // for (var product in dealProducts) {
        //   print(product.toJson());
        // }
        // print('Rest Products: $restProducts');
        // for (var product in restProducts) {
        //   print(product.toJson());
        // }

        return ProductData(allProducts: allProducts);
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode} - ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      final OrderCheckoutController orderCheckoutController = Get.find();
      orderCheckoutController.errorMessage.value = 'Error fetching products: $e';
      orderCheckoutController.isLoading.value = false;
    }
    return null;
  }
}
