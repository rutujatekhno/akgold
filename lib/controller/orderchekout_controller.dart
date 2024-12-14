import 'dart:convert';
import 'package:ak_golden_project/controller/repeat_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../model/all_product_model.dart';
import '../model/cafe_orderall_model.dart';
import '../service/api.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import 'date_controller.dart';

class OrderCheckoutController extends GetxController {
  var dealProducts = <DealProducts>[].obs;
  var products = <AllProductModule>[].obs;
  var selectedIndex = 0.obs;
  var currentCarouselIndex = 0.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var totalQuantity = 0.obs;
  var totalPrice = 0.0.obs;
  var showCancelButton = true.obs;

  var orderNumber = ''.obs;
  var cafeName = ''.obs;
  var paymentTerm = ''.obs;
  var selectedDate = ''.obs;

  // var product = <Products>[].obs;

  double get gstAmount => 0;
  double get grandTotal => totalPrice.value + gstAmount + 0;
  var cartItems = <int, int>{}.obs;

  final ApiService apiService = Get.find<ApiService>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onClose() {
    print("OrderCheckoutController disposed");
    super.onClose();
  }

  void fetchProducts() async {
    isLoading.value = true;
    await apiService.fetchProducts();
  }

  Future<void> submitOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Retrieve token
    String? savedCafeId = prefs.getString('cafe_id');

    try {
      // Construct the list of ProductOrder objects
      List<ProductOrder> productOrders = [];
      for (var entry in cartItems.entries) {
        final productId = entry.key;
        final quantity = entry.value;
        final product = products.firstWhere((p) => p.productId == productId);

        productOrders.add(ProductOrder(
          productId: productId,
          description: product.name ?? 'No description',
          quantity: quantity,
          rate: (product.basePrice ?? 0).toDouble(),
          subTotalAmount: ((product.basePrice ?? 0) * quantity).toDouble(),
        ));
      }

      // Create the CreateCafeOrderModel object
      final DateController dateController = Get.put(DateController());
      CreateCafeOrderModel orderModel = CreateCafeOrderModel(
        cafeId: int.parse(savedCafeId!),
        orderDate: dateController.selectedDate.value,
        routeId: 23,
        totalAmount: totalPrice.value,
        orderNumber:
            orderNumber.value.isNotEmpty ? orderNumber.value : "TEMP_ORDER",
        paymentStatus: 1,
        paymentTermId: 2,
        products: productOrders,
        tax: 0,
        deliveryCharges: 10,
        // note: "Your note here", // Include a valid note value
      );

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

      // Handle the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        clearForm();
        final repeatController = Get.find<RepeatOrderController>();
        repeatController.fetchCafeOrders();

        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final String orderNumber = responseBody['order_number'];
        // Get.snackbar("Success", "Order created successfully!",
        //     backgroundColor: Colors.green,
        //     colorText: Colors.white,
        //     duration: Duration(milliseconds: 600));
        Get.dialog(
          Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 40.h,
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
                        // Get.toNamed('/home_screen');
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

  void clearForm() {
    orderNumber.value = '';
    cafeName.value = '';
    paymentTerm.value = '';
    selectedDate.value = '';
    totalPrice.value = 0;
    cartItems.clear();
  }

  void clearCart() {
    cartItems.clear();
    totalQuantity.value = 0;
    totalPrice.value = 0;
  }

  void repeatOrder(Orders order) {
    // 2. Add products from the repeated order to the cart
    for (var product in order.products!) {
      // ii.Second Step

      final productId = product.productId!;
      final quantity = product.quantity!;

      // Find the corresponding product from your product list
      final productDetails =
          products.firstWhereOrNull((p) => p.productId == productId);
      if (productDetails != null) {
        // Recalculate subtotal based on base price and quantity
        final subTotalAmount = (productDetails.basePrice ?? 0) * quantity;

        cartItems[productId] = quantity;
        totalQuantity.value += quantity;
        totalPrice.value += subTotalAmount;
      } else {
        // Handle case where product is not found in the product list
        // You might want to show an error message or skip the product
        print("Product with ID $productId not found in product list");
      }
    }
    Get.toNamed('/billdetails');
  }

  void addProductToCart(AllProductModule product) {
    final productId = product.productId ?? 0;
    final basePrice = product.basePrice ?? 0;

    final currentQuantity = cartItems[productId] ?? 0;
    cartItems[productId] = (cartItems[productId] ?? 0) + 1;
    totalQuantity.value = 0;
    totalPrice.value += basePrice;

    _showSnackbar(
      message: "₹${totalPrice.value} | ${totalQuantity.value} item(s) added",
      actionText: "View Cart",
      action: () {
        Get.find<PersistentTabController>()
            .jumpToTab(3);
        // Get.toNamed('/billdetails');
      },
    );
  }

  // Method to remove a single product from the cart
  void removeProductFromCart(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]! > 0) {
      final product = products.firstWhere((p) => p.productId == productId,
          orElse: () => AllProductModule());
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
    if (cartItems.containsKey(productId)) {
      final productToRemove = products.firstWhere(
          (p) => p.productId == productId,
          orElse: () => AllProductModule());
      final quantityToRemove = cartItems[productId]!;

      // Update total price and total quantity
      totalQuantity.value -= quantityToRemove;
      totalPrice.value -= (productToRemove.basePrice ?? 0) * quantityToRemove;

      // Remove the product from the cart
      cartItems.remove(productId);
    }
  }

  void decreaseProductQuantity(int productId) {
    if (cartItems.containsKey(productId) && cartItems[productId]! > 0) {
      final product = products.firstWhere((p) => p.productId == productId,
          orElse: () => AllProductModule());
      final basePrice = product.basePrice ?? 0;

      totalQuantity.value -= 1;
      totalPrice.value -= basePrice;

      cartItems[productId] = cartItems[productId]! - 1;
      if (cartItems[productId] == 0) {
        cartItems.remove(productId);
      }
    }
  }

  void increaseProductQuantity(int productId) {
    final product = products.firstWhere((p) => p.productId == productId,
        orElse: () => AllProductModule());
    final basePrice = product.basePrice ?? 0;

    cartItems[productId] = (cartItems[productId] ?? 0) + 1;
    totalQuantity.value += 1;
    totalPrice.value += basePrice;
  }

  List<AllProductModule> get selectedProducts {
    return products
        .where((product) => cartItems.containsKey(product.productId))
        .toList();
  }

  void navigateToBillDetails() {
    if (cartItems.isNotEmpty) {
      Get.toNamed('/billdetails', arguments: {
        'selectedProducts': products
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

  void _showSnackbar(
      {required String message, String? actionText, VoidCallback? action}) {
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
          duration: Duration(milliseconds: 1000)),
    );
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
      clearForm(); // Clear the cart and form data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Your Order Cancelled"),
          duration: Duration(milliseconds: 800),
          behavior: SnackBarBehavior.floating, // Set behavior to floating
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 180, // Adjust as needed
          ),
        ),
      );
    }
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
      'payment_term_id': paymentTermId,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}
