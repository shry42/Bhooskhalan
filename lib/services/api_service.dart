import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://bhusanket.gsi.gov.in/webapi';

  /// Generic GET request
  static Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Referer': 'https://bhusanket.gsi.gov.in/',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw HttpException(
            'GET $endpoint failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('ApiService GET error: $e');
      rethrow;
    }
  }

  /// Generic POST request
  static Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Referer': 'https://bhusanket.gsi.gov.in/',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw HttpException(
            'POST $endpoint failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('ApiService POST error: $e');
      rethrow;
    }
  }

  /// ✅ Generic PUT request
  // Add this inside ApiService class
static Future<dynamic> put(String endpoint) async {
  final url = Uri.parse('$_baseUrl$endpoint');

  try {
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Referer': 'https://bhusanket.gsi.gov.in/',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException(
          'PUT $endpoint failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('ApiService PUT error: $e');
    rethrow;
  }
}

}