import 'package:bhooskhalan/screens/forecast_bulletin_screen.dart';
import 'package:bhooskhalan/screens/profile_screen.dart';
import 'package:bhooskhalan/screens/recent_news_screen.dart';
import 'package:bhooskhalan/screens/report_landslide_dialog.dart';
import 'package:bhooskhalan/screens/view_landslide_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_HomeCardItem> items = [
      _HomeCardItem("Report a Landslide", "assets/report.png"),
      _HomeCardItem("View my Landslide reports", "assets/view_reports.png"),
      _HomeCardItem("All Reports", "assets/all_reports.png"),
      _HomeCardItem("Basic Information on Landslides", "assets/basic_info.png"),
      _HomeCardItem("Forecast Bulletin", "assets/forecast_bulletin.png"),
      _HomeCardItem("Recent News", "assets/recent_news.png"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap:(){
                Get.to(MyProfileScreen());
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return _buildCard(items[index]);
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // Logout logic
                },
                child: const Text("LOG OUT",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildCard(_HomeCardItem item) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: InkWell(
      onTap: () {
        if (item.title == "Report a Landslide") {
          showSafetyDialog(Get.context!); // Call the dialog
        } else if(item.title == "View my Landslide reports"){
          Get.to(()=>RecentReportsPage());
        } else if(item.title == "Forecast Bulletin"){
          Get.to(()=>ForecastBulletinPage());
        }else if(item.title == "Recent News"){
          Get.to(()=>RecentNewsScreen());
        }
        
      },
      borderRadius: BorderRadius.circular(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}

class _HomeCardItem {
  final String title;
  final String imagePath;

  _HomeCardItem(this.title, this.imagePath);
}


void showSafetyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const SafetyDialog(),
  );
}
