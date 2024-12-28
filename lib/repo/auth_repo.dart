import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/api.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${Constants.baseUrl}$endpoint');

    try {
      // Retrieve the token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      // Include the token in the headers
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Adjust based on your API's token format
      };

      // Make the POST request
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      // Decode the response body
      return json.decode(response.body);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}