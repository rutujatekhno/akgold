import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/allpayment_term_model.dart';

class PaymentTermsController extends GetxController {
  RxList<AllPaymentTermsModel> paymentTermsList = <AllPaymentTermsModel>[].obs;
  RxBool isLoading = false.obs;
  Rx<AllPaymentTermsModel?> selectedPaymentTerm = Rx<AllPaymentTermsModel?>(null);

  // Function to fetch all payment terms
  Future<void> fetchPaymentTerms() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('http://98.70.51.184:3010/GetAllPaymentTerms'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)[0];
        paymentTermsList.value = data.map((e) => AllPaymentTermsModel.fromJson(e)).toList();
      } else {
        print('Failed to load payment terms');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
