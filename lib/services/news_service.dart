import 'dart:convert';
import 'package:bhooskhalan/models/news_item_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String baseUrl = 'https://bhusanket.gsi.gov.in/webapi';

static Future<List<NewsItem>> fetchNews() async {
  final url = Uri.parse('$baseUrl/News/datalist');

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Referer': 'https://bhusanket.gsi.gov.in/',
    },
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> result = data['result'];

    List<NewsItem> newsList =
        result.map((item) => NewsItem.fromJson(item)).toList();

    // Reverse the list so last item comes first
    newsList = newsList.reversed.toList();

    return newsList;
  } else {
    throw Exception('Failed to load news. Status code: ${response.statusCode}');
  }
}

}
