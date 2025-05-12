class NewsItem {
  final String id;
  final String content;
  final String date;

  NewsItem({required this.id, required this.content, required this.date});

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      id: json['ID'],
      content: json['News_Content'],
      date: json['DateColumn'],
    );
  }
}
