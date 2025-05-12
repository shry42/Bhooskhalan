import 'package:bhooskhalan/models/news_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/news_service.dart';

class RecentNewsScreen extends StatefulWidget {
  @override
  _RecentNewsScreenState createState() => _RecentNewsScreenState();
}

class _RecentNewsScreenState extends State<RecentNewsScreen> {
  late Future<List<NewsItem>> _newsList;

  @override
  void initState() {
    super.initState();
    _newsList = NewsService.fetchNews();
  }

  String formatDate(String rawDate) {
    try {
      final parsedDate = DateTime.parse(rawDate);
      return DateFormat('dd MMMM yyyy').format(parsedDate);
    } catch (e) {
      return rawDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent News'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: FutureBuilder<List<NewsItem>>(
        future: _newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error fetching news"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No news found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final news = snapshot.data![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    news.content,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(formatDate(news.date)),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
