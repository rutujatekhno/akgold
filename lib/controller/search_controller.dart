import 'package:get/get.dart';

class SearchController extends GetxController {
  // Observable for storing the search query
  var searchText = ''.obs;
  // Observable for storing the filtered search results
  var searchResults = <Map<String, String>>[].obs;

  void searchOrder(String query, List<Map<String, String>> orders) {
    // Filter the orders based on the query
    searchResults.value = orders.where((order) {
      return order['orderNumber']!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }


}
