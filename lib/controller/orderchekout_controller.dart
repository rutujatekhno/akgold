import 'dart:convert';
import 'package:ak_golden_project/controller/repeat_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../model/AllGetRoutesModel.dart';
import '../model/all_product_model.dart';
import '../model/cafe_orderall_model.dart';
import '../service/api.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'date_controller.dart';

class OrderCheckoutController extends GetxController {
  var restProducts = <AllProductModule>[].obs;  // Observable list for rest products
  var dealProducts = <AllProductModule>[].obs;
  var selectedIndex = 0.obs;
  var currentCarouselIndex = 0.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var totalQuantity = 0.0.obs;
  var totalPrice = 0.0.obs;
  var showCancelButton = true.obs;
// In your OrderCheckoutController
  List<AllProductModule> allProducts = [];
  var orderNumber = ''.obs;
  var cafeName = ''.obs;
  var selectedDate = ''.obs;

  var routesId = 0.obs;
  var paymentTermsId = 0.obs;

  // GST and grand total logic
  double get gstAmount => 0;
  double get grandTotal => totalPrice.value + gstAmount + 0;
  var cartItems = <int, int>{}.obs;
  Map<int, double> productWeights = {};
  var cartWeights = <int, double>{}.obs;  // Stores weights for per-kg products
  var cartPrices = <int, double>{}.obs;
  var weightUnit = 'kg'.obs;

  final ApiService apiService = Get.find<ApiService>();

  @override
  void onInit() async{
    super.onInit();
    fetchProducts();
  await  fetchCafeDetails();
  }

  @override
  void onClose() {
    print("OrderCheckoutController disposed");
    super.onClose();
  }


  Future<void> fetchCafeDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedCafeId = prefs.getString('cafe_id');
    String? token = prefs.getString('token');

    try {
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}/findCafeById/$savedCafeId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          final Map<String, dynamic> cafeData = data[0] as Map<String, dynamic>;
          final findCafeByIdModel cafeDetails = findCafeByIdModel.fromJson(cafeData);

          print('Route ID from API: ${cafeDetails.routesId}');
          print('Payment Terms ID from API: ${cafeDetails.paymentTermsId}');

          routesId.value = cafeDetails.routesId ?? 0;
          paymentTermsId.value = cafeDetails.paymentTermsId ?? 0;
          print("routeID from fetch cafe details $routesId");
        } else {
          print('Cafe details list is empty');
        }
      } else {
        print('Failed to fetch cafe details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching cafe details: $e');
    }
  }

  // Fetch products (can be either 'rest' or 'deal')
  void fetchProducts() async {
    isLoading.value = true;
    await apiService.fetchProducts();
    isLoading.value= false;
  }

  Future<void> submitOrder() async {

    if (cartItems.isEmpty) {
      Get.snackbar("Error", "Your cart is empty. Please add items to your order.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(milliseconds: 600));
      return; // Prevent further execution
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Retrieve token
    String? savedCafeId = prefs.getString('cafe_id');
    print('Saved Cafe ID: $savedCafeId');

    await fetchCafeDetails();


    try {
      List<ProductOrder> productOrders = [];
      for (var entry in cartItems.entries) {
        final productId = entry.key;
        final quantity = entry.value;

        final product = _findProductById(productId);

        final price = product.dealPrice ?? product.basePrice ?? 0;

        final subTotalAmount = price * quantity;

        productOrders.add(ProductOrder(
          productId: productId,
          description: product.name ?? 'No description',
          quantity: quantity,
          rate: price.toDouble(),
          subTotalAmount: subTotalAmount.toDouble(),
        ));
      }

      final DateController dateController = Get.put(DateController());
      CreateCafeOrderModel orderModel = CreateCafeOrderModel(
        cafeId: int.parse(savedCafeId!),
        orderDate: dateController.selectedDate.value,
        routeId: routesId.value,
        totalAmount: totalPrice.value,
        orderNumber:
        orderNumber.value.isNotEmpty ? orderNumber.value : "TEMP_ORDER",
        paymentStatus: 0,
        paymentTermId: paymentTermsId.value,
        products: productOrders,
        tax: 0,
        deliveryCharges: 0,
        deliveryStatus: 0
      );
      print("Ordernum,RouteID");
print(orderNumber);
print(routesId);
      if (orderModel.cafeId == null || orderModel.orderDate == null) {
        Get.snackbar("Error", "Missing required order information.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: const Duration(milliseconds: 600));
        return;
      }

      // Send the POST request
      var requestBody = jsonEncode(orderModel.toJson());
      print("Request Body: $requestBody");

      final response = await http.post(
        Uri.parse('${Constants.baseUrl}/CreateCafeOrder'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        clearForm();
        final repeatController = Get.find<RepeatOrderController>();
        repeatController.fetchCafeOrders();

        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String orderNumber = responseBody['order_number'];

        Get.dialog(
          Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 45.h,
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset('assets/images/deliverybox.png'),
                    SizedBox(height: 15),
                    const Text(
                      "Your Order has been Confirmed !!",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Thank you for your Purchase",
                      style: TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Your order number is ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                        children: [
                          TextSpan(
                            text: orderNumber,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "You'll get an email confirmation for your order details",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed('/bottom_screen');
                        Get.find<PersistentTabController>().jumpToTab(0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.brown),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Go to Homepage',
                        style: GoogleFonts.inter(
                            color: Colors.brown,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          barrierDismissible: true,
        );
        print('Response body: ${response.body}');
      } else {
        print("Request Body: $requestBody");
        Get.snackbar("Error", "Failed to create order. Please try again.",
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(milliseconds: 600));
        print('Response body: ${response.body}');
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
      print('Error: $e'); // Debugging line
    }
  }

  // Find product by ID from either restProducts or dealProducts
  AllProductModule _findProductById(int productId) {
    final product = restProducts.firstWhereOrNull((p) => p.productId == productId)
        ?? dealProducts.firstWhereOrNull((p) => p.productId == productId);

    return product ?? AllProductModule(); // Return empty module if not found
  }

  void clearForm() {
    orderNumber.value = '';
    cafeName.value = '';
    paymentTermsId.value = 0;
    selectedDate.value = '';
    totalPrice.value = 0;
    cartItems.clear();
  }

  void repeatOrder(Orders order) {
    cartItems.clear(); // Clear existing cart items
    totalQuantity.value = 0; // Reset total quantity
    totalPrice.value = 0;

    if (order.products == null || order.products!.isEmpty) {
      print('No products to repeat');
      return;
    }

    for (var product in order.products!) {
      final productId = product.productId;
      final quantity = product.quantity;

      if (productId == null || quantity == null) {
        print("Invalid product or quantity for product ID $productId");
        continue;
      }

      final productDetails = _findProductById(productId);

      if (productDetails != null) {
        final price = productDetails.dealPrice ?? productDetails.basePrice ?? 0.0; // Ensure price is double
        final subTotalAmount = price * quantity;

        print("Cart Items: $cartItems");

        // Ensure quantity is treated as an integer
        cartItems[productId] = quantity.toInt();
        totalQuantity.value += quantity.toInt(); // Convert quantity to int
        totalPrice.value += subTotalAmount; // This can remain as double
      } else {
        print("Product with ID $productId not found in product list");
      }
    }

    print("Total Quantity: ${totalQuantity.value}");
    print("Total Price: ${totalPrice.value}");

    Future.delayed(Duration(milliseconds: 100), () {
      Get.toNamed('/billdetails');
    });
  }


  void addProductToCart(AllProductModule product) {
    final productId = product.productId ?? 0;

    if (product.priceScale == 'Per Item') {
      _addPerItemProduct(product);
      // Show snackbar after adding per-item product
      Get.snackbar(
        '',
        '',
        titleText: Container(),
        messageText: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹${totalPrice.value.toStringAsFixed(2)} | ${totalQuantity.value} item(s) added",
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.find<PersistentTabController>().jumpToTab(3);
                    },
                    child: const Text(
                      "View Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
        // duration: const Duration(milliseconds: 1000),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOut,
      );
    } else if (product.priceScale == 'Per kg') {
      _addPerKgProduct(product);
      // Show snackbar after adding per-kg product
      Get.snackbar(
        '',
        '',
        titleText: Container(),
        messageText: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Enter weight in KGs.",
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.find<PersistentTabController>().jumpToTab(3);
                    },
                    child: const Text(
                      "View Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.shopping_cart, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
        // duration: const Duration(milliseconds: 1000),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOut,
      );
    }
  }

  void _addPerItemProduct(AllProductModule product) {
    final productId = product.productId ?? 0;
    final price = product.dealPrice ?? product.basePrice ?? 0;

    cartItems[productId] = (cartItems[productId] ?? 0) + 1;
    totalQuantity.value += 1;
    totalPrice.value += price;
    cartPrices[productId] = (price * (cartItems[productId] ?? 1)).toDouble();

    update();
  }
  void _addPerKgProduct(AllProductModule product) {
    final productId = product.productId ?? 0;
    cartWeights[productId] = 0.0;  // Initialize weight to 0
    cartItems[productId] = 1;      // Set quantity to 1 for per-kg items
    cartPrices[productId] = 0.0;   // Initialize price to 0
    update();
  }
  void _showSnackbar({
    required String message,
    String? actionText,
    VoidCallback? action,
  }) {
    Get.showSnackbar(
      GetBar(
        messageText: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
              if (actionText != null && action != null)
                TextButton(
                  onPressed: action,
                  child: Text(actionText,
                      style: const TextStyle(color: Colors.white)),
                ),
              const Icon(Icons.shopping_cart, color: Colors.white),
            ],
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  // Method to remove a single product from the cart
  void removeProductFromCart(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]! > 0) {
      final product = _findProductById(productId);
      final makingPrice = product.makingPrice ?? 0;

      totalQuantity.value -= 1;
      totalPrice.value -= makingPrice;

      cartItems[productId] = cartItems[productId]! - 1;

      if (cartItems[productId] == 0) {
        cartItems.remove(productId);
      }
    }
  }

  void removeAllProducts(int productId) {
    final product = _findProductById(productId);

    if (cartItems.containsKey(productId)) {
      if (product.priceScale == 'Per kg') {
        cartWeights.remove(productId);
      }

      totalPrice.value -= cartPrices[productId] ?? 0.0;
      cartItems.remove(productId);
      cartPrices.remove(productId);
    }

    update();
  }
  void decreaseProductQuantity(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]! > 0) {
      final product = _findProductById(productId);
      // final basePrice = product.basePrice ?? 0;

      final price = product.dealPrice != null ? product.dealPrice : product.basePrice;

      totalQuantity.value -= 1;
      totalPrice.value -= price!;

      cartItems[productId] = cartItems[productId]! - 1;
      if (cartItems[productId] == 0) {
        cartItems.remove(productId);
      }
    }
  }

  void increaseProductQuantity(int productId) {
    final product = _findProductById(productId);
    // final basePrice = product.basePrice ?? 0;
    final price = product.dealPrice != null ? product.dealPrice : product.basePrice; // Use dealPrice or basePrice


    cartItems[productId] = (cartItems[productId] ?? 0) + 1;
    totalQuantity.value += 1;
    totalPrice.value += price!;
  }

  void updateWeight(int productId, String value) {
    try {
      // Convert input value to double (allowing decimal points)
      final weightInKg = double.tryParse(value) ?? 0.0;
      // Convert kg to grams
      final weightInGrams = weightInKg * 1000;

      final product = _findProductById(productId);
      if (product.priceScale != 'Per kg') return;

      final pricePerKg = (product.dealPrice ?? product.basePrice ?? 0).toDouble();
      final calculatedPrice = (pricePerKg * weightInKg).toDouble(); // Use weightInKg directly for price calculation

      cartWeights[productId] = weightInGrams;
      cartPrices[productId] = calculatedPrice;

      // Update total price
      _recalculateTotalPrice();

      update();
    } catch (e) {
      print('Error updating weight: $e');
    }
  }  void _recalculateTotalPrice() {
    double newTotal = 0.0;

    cartItems.forEach((productId, quantity) {
      final product = _findProductById(productId);

      if (product.priceScale == 'Per Item') {
        final price = product.dealPrice ?? product.basePrice ?? 0.0;
        newTotal += price * quantity;
      } else if (product.priceScale == 'Per kg') {
        newTotal += cartPrices[productId] ?? 0.0;
      }
    });

    totalPrice.value = newTotal;
  }

  double updateTotalPrice(int productId) {
    final product = allProducts.firstWhere((p) => p.productId == productId);
    final weightInGrams = productWeights[productId] ?? 0.0;
    final pricePerKg = product.dealPrice ?? product.basePrice ?? 0.0;
    final pricePerGram = pricePerKg / (product.priceScale == 'Per Kg' ? 1000 : 1);
    final totalPrice = pricePerGram * weightInGrams;
    return totalPrice;
  }

  List<AllProductModule> get selectedProducts {
    return [...restProducts, ...dealProducts]
        .where((product) => cartItems.containsKey(product.productId))
        .toList();
  }
  String getDisplayWeight(int productId) {
    final weightInGrams = cartWeights[productId] ?? 0.0;
    final weightInKg = weightInGrams / 1000;
    return weightInKg.toStringAsFixed(3); // Show up to 3 decimal places for kg
  }
  double getPriceToDisplay(int productId) {
    return cartPrices[productId] ?? 0.0;
  }
  void navigateToBillDetails() {
    if (cartItems.isNotEmpty) {
      Get.toNamed('/billdetails', arguments: {
        'selectedProducts': [...restProducts, ...dealProducts]
            .where((product) => cartItems.containsKey(product.productId))
            .toList(),
        'totalPrice': totalPrice.value,
        'totalQuantity': totalQuantity.value,
      });
    } else {
      Get.snackbar(
        "Cart Empty",
        "Please add items to the cart first.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void cancelOrder(BuildContext context) {
    if (cartItems.isEmpty) {
      Get.snackbar(
        "Error",
        "Please add products to your cart.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(milliseconds: 900),
      );
    } else {
      clearForm();
      clearCart();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Your Order Cancelled"),
          duration: Duration(milliseconds: 800),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 180,
          ),
        ),
      );
    }
  }
  @override
  void clearCart() {
    cartItems.clear();
    cartWeights.clear();
    cartPrices.clear();
    totalQuantity.value = 0;
    totalPrice.value = 0;
    update();
  }
}



class ProductOrder {
  final int productId;
  final String description;
  final int quantity;
  final double rate;
  final double subTotalAmount;

  ProductOrder({
    required this.productId,
    required this.description,
    required this.quantity,
    required this.rate,
    required this.subTotalAmount,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'description': description,
      'quantity': quantity,
      'rate': rate,
      'sub_total_amount': subTotalAmount,
    };
  }
}

class CreateCafeOrderModel {
  final int cafeId;
  final int routeId;
  final String orderNumber;
  final String orderDate;
  final double totalAmount;
  final double tax;
  final double deliveryCharges;
  final int paymentStatus;
  final int paymentTermId;
  final int? deliveryStatus;
  final List<ProductOrder> products;

  CreateCafeOrderModel({
    required this.cafeId,
    required this.routeId,
    required this.orderNumber,
    required this.orderDate,
    required this.totalAmount,
    required this.tax,
    required this.deliveryCharges,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.paymentTermId,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      'cafe_id': cafeId,
      'route_id': routeId,
      'order_number': orderNumber,
      'order_date': orderDate,
      'total_amount': totalAmount,
      'tax': tax,
      'delivery_charges': deliveryCharges,
      'payment_status': paymentStatus,
      'delivery_status' : deliveryStatus,
      'payment_term_id': paymentTermId,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
